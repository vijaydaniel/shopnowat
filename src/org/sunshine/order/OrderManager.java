package org.sunshine.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.sunshine.database.HibernateDataAccess;
import org.sunshine.domain.ShoppingBasket;
import org.sunshine.domain.ShoppingCart;
import org.sunshine.domain.ShoppingCartItems;
import org.sunshine.domain.ShoppingCustomerInfo;
import org.sunshine.jms.JmsQueueSender;

@Service
public class OrderManager {

	@Autowired
	private HibernateDataAccess hibernateDataAccess;
	
	private JmsQueueSender jmsQueueSender;
	
	private int cart_id;

	public void setHibernateDataAccess(HibernateDataAccess hibernateDataAccess) {
		this.hibernateDataAccess = hibernateDataAccess;
	}

	public void placeOrder(ShoppingBasket order) {
		insertShoppingCart(order.getShoppingCart());
		insertShoppingCartItems(order.getShoppingCartItems());
		insertShoppingCustomerInfo(order.getShoppingCustomerInfo());
		getJmsQueueSender().simpleSend(order);
	}

	public String getOrderInFormat(ShoppingBasket order) {
		String orderInFormat = "";
		orderInFormat = orderInFormat + "Custmer Name:"
				+ order.getShoppingCustomerInfo().getName();
		orderInFormat = orderInFormat + "Order Number:"
				+ order.getOrderNumber();
		orderInFormat = orderInFormat + "Shopping Cart:"
				+ order.getShoppingCart().toString();
		orderInFormat = orderInFormat + "Products:"
				+ order.getShoppingCartItems().toString();
		orderInFormat = orderInFormat + "Shopping Customer Info:"
				+ order.getShoppingCustomerInfo().toString();
		return orderInFormat;
	}

	public void insertShoppingCart(ShoppingCart cart) {
		hibernateDataAccess.saveObject(cart);
		cart_id = cart.getCart_id();
	}

	public void insertShoppingCartItems(List<ShoppingCartItems> cartItems) {
		for (ShoppingCartItems shoppingCartItems : cartItems) {
			shoppingCartItems.setCart_id(cart_id);
		}
		hibernateDataAccess.saveAllObject(cartItems);
	}

	public void insertShoppingCustomerInfo(ShoppingCustomerInfo customerInfo) {
		customerInfo.setCart_id(cart_id);
		hibernateDataAccess.saveObject(customerInfo);
	}

	public JmsQueueSender getJmsQueueSender() {
		try{
		 ApplicationContext context = 
    	  new ClassPathXmlApplicationContext("classpath*:resources/shopnowat-servlet.xml");
		jmsQueueSender = (JmsQueueSender) context.getBean("orderSender");
		}catch(Exception e){
			e.printStackTrace();
		}
		return jmsQueueSender;
	}

	/*public void setJmsQueueSender(JmsQueueSender jmsQueueSender) {
		this.jmsQueueSender = jmsQueueSender;
	}*/

}