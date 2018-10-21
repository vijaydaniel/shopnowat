package org.sunshine.jms;

import java.util.List;

import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.ObjectMessage;
import javax.mail.internet.MimeMessage;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.sunshine.domain.ShoppingBasket;
import org.sunshine.domain.ShoppingCartItems;

public class OrderMessageListener implements MessageListener {

	
	private JavaMailSender mailSender;
	
	private SimpleMailMessage templateMessage;
	
    public void onMessage(Message message) {
        if (message instanceof ObjectMessage) {
            try {
                System.out.println("received message - shopping info"+((ObjectMessage) message).toString());
                ObjectMessage objMessage = (ObjectMessage)message;
                ShoppingBasket basket = (ShoppingBasket) objMessage.getObject();
                System.out.println("order number:"+basket.getOrderNumber());
                sendMail(basket);  
                System.out.println("mail sent");
            }
            catch (Exception ex) {
            	ex.printStackTrace();
                throw new RuntimeException(ex);
            }
        }
        else {
            throw new IllegalArgumentException("Message must be of type TextMessage");
        }
    }
    
	public void sendMail(ShoppingBasket order) {
		try {
		/*SimpleMailMessage msg = new SimpleMailMessage(getTemplateMessage());
		msg.setTo(order.getStore().getEmailId());
		msg.setCc(order.getShoppingCustomerInfo().getEmail_id());
		msg.setSubject("Eshopper order number:" + order.getOrderNumber());
		
		msg.setText("Dear "
				+ order.getShoppingCustomerInfo().getName()
				+ ", thank you for placing order. Please find your order details: "
				+ getOrderInFormat(order));*/
		
		MimeMessage mimeMessage = getMailSender().createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "utf-8");
		String htmlMsg = "<h3 align=\"left\">Dear "+ order.getShoppingCustomerInfo().getName() +",</h3>";
		//htmlMsg = htmlMsg + "&nbsp;";
		htmlMsg = htmlMsg + "<p>Thank you for placing your order at ShopNowAt. Your order is confirmed. Please find the details of your order as below</p>";
		htmlMsg = htmlMsg + "&nbsp;";
		htmlMsg = htmlMsg + "<table>";
		htmlMsg = htmlMsg + "<tr><td><b align=\"left\">Customer Details</td></tr>";
		htmlMsg = htmlMsg + "<tr><td>"+ order.getShoppingCustomerInfo().getName()+"</td></tr>";
		htmlMsg = htmlMsg + "<tr><td>"+ order.getShoppingCustomerInfo().getAddress()+"</td></tr>";
		htmlMsg = htmlMsg + "<tr><td>"+ order.getShoppingCustomerInfo().getPhone_number()+"</td></tr>";
		htmlMsg = htmlMsg + "<tr><td>"+ order.getShoppingCustomerInfo().getAlternate_phone_number()+"</td></tr>";
		htmlMsg = htmlMsg + "</table>";
		htmlMsg = htmlMsg + "&nbsp;<table border=\"1\">";
		htmlMsg = htmlMsg + "<tr><th>No</th><th>Product Name</th><th>Quantity</th><th>Price</th></tr>";
		
		List<ShoppingCartItems> shoppingCartItems = order.getShoppingCartItems();
		int i = 1;
		int total = 0;
		for (ShoppingCartItems shoppingCartItems2 : shoppingCartItems) {
			int quantity = shoppingCartItems2.getItem_quality();
			String price_pname = order.getProductIdMapping().get(shoppingCartItems2.getProduct_id());
			String[] ppName = price_pname.split("_");
			String price = ppName[0];
			total = total + new Double(price).intValue();
			String pname = ppName[1];
			htmlMsg = htmlMsg + "<tr><td>"+i+"</td><td>"+pname+"</td><td>"+quantity+"</td><td align=\"right\">"+price+"</td></tr>";
			i++;
		}
		htmlMsg = htmlMsg + "<tr><td> </td><td> </td><td><b>Total</td><td>Rs."+total+"</b></td></tr>";
		htmlMsg = htmlMsg + "</table>";

		htmlMsg = htmlMsg + "&nbsp;<table>";
		htmlMsg = htmlMsg + "<tr><td><b align=\"left\">Store Details</b></td></tr>";
		htmlMsg = htmlMsg + "<tr><td>"+ order.getStore().getName()+"</td></tr>";
		htmlMsg = htmlMsg + "<tr><td>"+ order.getStore().getAddress()+"</td></tr>";
		htmlMsg = htmlMsg + "<tr><td>"+ order.getStore().getPhoneNumber()+"</td></tr>";
		htmlMsg = htmlMsg + "<tr><td>"+ order.getStore().getAlternatePhoneNumber()+"</td></tr>";
		htmlMsg = htmlMsg + "</table>";
		
		htmlMsg = htmlMsg + "<br><table>";
		htmlMsg = htmlMsg + "<tr><td>With Regards,</td></tr>";
		htmlMsg = htmlMsg + "<tr><td>Team ShopNowAt</td></tr>";
		htmlMsg = htmlMsg + "</table>";		
		
		mimeMessage.setContent(htmlMsg, "text/html");
		helper.setTo(order.getStore().getEmailId());
		helper.setCc(order.getShoppingCustomerInfo().getEmail_id());
		helper.setSubject("ShopNowAt: Order confirmation");
		helper.setFrom("shopnowat@gmail.com");
		
		mailSender.send(mimeMessage);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public String getOrderInFormat(ShoppingBasket order) {
		String orderInFormat = "";
		orderInFormat = orderInFormat + "Custmer Name:"
				+ order.getShoppingCustomerInfo().getName();
		orderInFormat = orderInFormat + "Order Number:"
				+ order.getOrderNumber();
		orderInFormat = orderInFormat + "Shopping Cart:"
				+ order.getShoppingCart().toString();
		/*orderInFormat = orderInFormat + "Products:"
				+ order.getShoppingCartItems().toString();*/
		orderInFormat = orderInFormat + "Shopping Customer Info:"
				+ order.getShoppingCustomerInfo().toString();
		return orderInFormat;
	}

	public SimpleMailMessage getTemplateMessage() {
		ApplicationContext context = 
		    	  new ClassPathXmlApplicationContext("classpath*:resources/mails.xml");
		this.templateMessage = (SimpleMailMessage) context.getBean("templateMessage");
		return this.templateMessage;
	}

	public void setTemplateMessage(SimpleMailMessage templateMessage) {
		//this.templateMessage = templateMessage;
	}
	
	public JavaMailSender getMailSender() {
		ApplicationContext context = 
		    	  new ClassPathXmlApplicationContext("classpath*:resources/mails.xml");
		this.mailSender = (JavaMailSender) context.getBean("mailSender");
		return this.mailSender;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}


/*	public MailSender getMailSender() {
		ApplicationContext context = 
		    	  new ClassPathXmlApplicationContext("classpath*:resources/mails.xml");
		this.mailSender = (JavaMailSender) context.getBean("mailSender");
		return this.mailSender;
	}
	
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
*/
}