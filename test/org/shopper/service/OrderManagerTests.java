package org.shopper.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import junit.framework.TestCase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.sunshine.domain.ShoppingBasket;
import org.sunshine.domain.ShoppingCart;
import org.sunshine.domain.ShoppingCartItems;
import org.sunshine.domain.ShoppingCustomerInfo;
import org.sunshine.domain.Store;

public class OrderManagerTests extends TestCase{

	private ShoppingBasket basket = new ShoppingBasket();
	private ShoppingCart cart = new ShoppingCart();
	private List<ShoppingCartItems> shoppingCartItems = new ArrayList<ShoppingCartItems>();;
	private ShoppingCustomerInfo shoppingCustomerInfo = new ShoppingCustomerInfo();
	private Store store = new Store();
	
	public void setCart(){
		cart.setCreate_date(new Date());
		cart.setEshopper_status("paid");
		cart.setPurchase_status("delivered");
		cart.setSession_id("1234");
		cart.setStore_id(1);
		cart.setTotal_amount(2000);
	}
	
	public void setShoppingCustomerInfo(){
		shoppingCustomerInfo.setAddress("ooty");
		shoppingCustomerInfo.setAlternate_phone_number("345");
		shoppingCustomerInfo.setEmail_id("vijay.danny@gmail.com");
		shoppingCustomerInfo.setName("vijay");
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
		store.setAddress("commercial st");
		store.setAlternatePhoneNumber("4");
		store.setDescription("description");
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
	
	public ShoppingBasket getBasket() {
		setCart();
		setShoppingCartItems();
		setShoppingCustomerInfo();
		setStore();
		setShoppingBasket();
		return basket;
	}

}
