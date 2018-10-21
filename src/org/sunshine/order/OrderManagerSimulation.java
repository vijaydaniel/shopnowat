package org.sunshine.order;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import junit.framework.TestCase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.sunshine.domain.ShoppingBasket;
import org.sunshine.domain.ShoppingCart;
import org.sunshine.domain.ShoppingCartItems;
import org.sunshine.domain.ShoppingCustomerInfo;
import org.sunshine.domain.Store;

public class OrderManagerSimulation {

	private ShoppingBasket basket = new ShoppingBasket();
	private ShoppingCart cart = new ShoppingCart();
	private List<ShoppingCartItems> shoppingCartItems = new ArrayList<ShoppingCartItems>();;
	private ShoppingCustomerInfo shoppingCustomerInfo = new ShoppingCustomerInfo();
	private Store store = new Store();
	private String[] status = {"pending","delivered"};
	Random rnd = new Random();
	
	public void setCart(){
		cart.setCreate_date(new Date());
		cart.setEshopper_status("paid");
		cart.setPurchase_status(status[rnd.nextInt(2)]);
		cart.setSession_id("1234"+Math.random());
		cart.setStore_id(1);
		cart.setTotal_amount(2000);
	}
	
	public void setShoppingCustomerInfo(){
		shoppingCustomerInfo.setAddress(makeRandomString());
		shoppingCustomerInfo.setAlternate_phone_number("345");
		shoppingCustomerInfo.setEmail_id("vijay.danny@gmail.com");
		shoppingCustomerInfo.setName("vijay"+makeRandomString());
		shoppingCustomerInfo.setPhone_number("456");
	}
	
	public void setShoppingCartItems(){
		ShoppingCartItems s1 = new ShoppingCartItems();
		ShoppingCartItems s2 = new ShoppingCartItems();
		s1.setItem_quality(2);
		s1.setProduct_id(1);
		s2.setItem_quality(5);
		s2.setProduct_id(2);
		shoppingCartItems.add(s1);
		shoppingCartItems.add(s2);
	}
	
	public void setStore(){
		store.setAddress("commercial st"+makeRandomString());
		store.setAlternatePhoneNumber("4");
		store.setDescription("description"+makeRandomString());
		store.setEmailId("vinoj.k@gmail.com");
		store.setName("new store");
		store.setPhoneNumber("42424");
	}
	
	public void setShoppingBasket(){
		basket.setOrderNumber(1);
		basket.setShoppingCartItems(shoppingCartItems);
		basket.setShoppingCart(cart);
		basket.setShoppingCustomerInfo(shoppingCustomerInfo);
		basket.setStore(store);
	}
	

	public String makeRandomString() {
		char nextChar;
		Random rnd = new Random();
		StringBuilder sb = new StringBuilder();

		for (int i = 0; i < 20; i++) {
			// lowercase characters go from 97 to 122
			nextChar = (char) (rnd.nextInt(26) + 97);
			sb.append(nextChar);
			if ((i + 1) % 5 == 0 && i != 19)
				sb.append('-');
		}

		return sb.toString();
	}

	public ShoppingBasket getBasket() {
		setCart();
		setShoppingCartItems();
		setShoppingCustomerInfo();
		setStore();
		setShoppingBasket();
		return basket;
	}

}
