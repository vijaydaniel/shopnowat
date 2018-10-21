package org.sunshine.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.sunshine.domain.ShoppingBasket;
import org.sunshine.domain.ShoppingBasketWrapper;
import org.sunshine.domain.ShoppingCart;
import org.sunshine.domain.ShoppingCartItems;
import org.sunshine.store.StoreService;
import org.sunshine.user.UserService;
//import org.sunshine.domain.Sample;

@Controller
public class OrderController {

	protected final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private OrderManager orderManager;
	@Autowired
	private OrderService orderService;
	@Autowired
	private UserService userService;
	@Autowired
	private StoreService storeService;

	@RequestMapping(value = "/order/confirmorder.htm", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	List<String> confirmOrder(@RequestBody ShoppingBasketWrapper shoppingBasketWrapper , HttpSession session) {
		System.out.println(shoppingBasketWrapper);
		ArrayList cartItems  = shoppingBasketWrapper.getShoppingCartItemsWrapper();
		System.out.println(cartItems);
		ArrayList<ShoppingCartItems> shoppingCartItems = new ArrayList<ShoppingCartItems>();
		Map<Integer,String> productIdMapping = new HashMap<Integer, String>();
		for (Object object : cartItems) {
			LinkedHashMap cartItem = (LinkedHashMap) object;
			Set set = cartItem.entrySet();
		      Iterator i = set.iterator();
		      while(i.hasNext()) {
		    	  ShoppingCartItems s = new ShoppingCartItems();
		         Map.Entry me = (Map.Entry)i.next();
		         s.setProduct_id(Integer.parseInt(me.getValue().toString()));
		         Map.Entry me1 = (Map.Entry)i.next();
		         s.setItem_quality(Integer.parseInt(me1.getValue().toString()));
		         Map.Entry me2 = (Map.Entry)i.next();
		         Map.Entry me3 = (Map.Entry)i.next();
		         
		         productIdMapping.put(Integer.parseInt(me.getValue().toString()),me3.getValue().toString().replace("Rs.", "")+"_"+me2.getValue().toString());
		         shoppingCartItems.add(s);
		      }
		}
		ShoppingBasket shoppingBasket = new ShoppingBasket();
		shoppingBasket.setOrderNumber(shoppingBasketWrapper.getOrderNumber());
		shoppingBasket.setShoppingCart(shoppingBasketWrapper.getShoppingCart());
		shoppingBasket.setShoppingCartItems(shoppingCartItems);
		shoppingBasket.setShoppingCustomerInfo(shoppingBasketWrapper.getShoppingCustomerInfo());
		shoppingBasket.setStore(shoppingBasketWrapper.getStore());
		shoppingBasket.setProductIdMapping(productIdMapping);
		
		shoppingBasket.getShoppingCart().setSession_id(session.getId());
		System.out.println(shoppingBasket.getShoppingCart().getSession_id());
		
		List<String> confirmation = new ArrayList<String>();
		getOrderManager().placeOrder(shoppingBasket);
		confirmation
				.add("your order is successfully placed and will be delevered as per the vendor norms. For any queries, kindly contact the store. A copy of order details is send to you via email");
		return confirmation;
	}
	
	@RequestMapping(value = "/view_orders.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ModelAndView getOrdersForStore(HttpSession session){
		Map<String, Object> orderSummaries = new HashMap<String, Object>();
		String storeid = (String) session.getAttribute("storeid");
		orderSummaries.put("orders", orderService.getOrderSummaryForStore(storeid));
		return new ModelAndView("view_orders", "model", orderSummaries);
	}
	
	@RequestMapping(value = "/view_delivered_orders.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ModelAndView getDeliveredOrdersForStore(HttpSession session){
		Map<String, Object> orderSummaries = new HashMap<String, Object>();
		String storeid = (String) session.getAttribute("storeid");
		orderSummaries.put("orders", orderService.getOrdersBasedOnPurchaseStatus(storeid,"delivered"));
		return new ModelAndView("view_delivered_orders", "model", orderSummaries);
	}
	
	@RequestMapping(value = "/display_order_detail.htm", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ModelAndView getOrderDetails(HttpServletRequest request){
		Map<String, Object> orderSummaries = new HashMap<String, Object>();
		String cartId = (String) request.getParameter("cartId");
		System.out.println(userService.getUserDetails(cartId));
		orderSummaries.put("customerInfo", userService.getUserDetails(cartId));
		orderSummaries.put("shoppingCartInfo", orderService.getShoppingCartItems(cartId));
		ShoppingCart shoppingCart = orderService.getShoppingCart(cartId);
		orderSummaries.put("shoppingCart", shoppingCart);
		
		orderSummaries.put("storeInfo", storeService.getStoreById(String.valueOf(shoppingCart.getStore_id())));
		
		return new ModelAndView("display_order_detail", "model", orderSummaries);
	}
	
	@RequestMapping(value = "/order/{cartId}/markOrderDelivered.htm", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<String> setCartPurchaseStatus(@PathVariable("cartId") String cartId)
			throws ServletException, IOException {

		logger.info("Cart ID: " + cartId);
		orderService.setCartPurchaseStatus(cartId,"delivered");

		List<String> message = new ArrayList<String>();
        message.add("Cart ID: '" + cartId + "' is successfully updated");
        return message;		
        }

	public OrderManager getOrderManager() {
		return orderManager;
	}

	public void setOrderManager(OrderManager orderManager) {
		this.orderManager = orderManager;
	}

}