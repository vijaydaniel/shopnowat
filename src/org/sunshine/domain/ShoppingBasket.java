package org.sunshine.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.ElementCollection;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlList;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.annotate.JsonAutoDetect;
import org.codehaus.jackson.annotate.JsonCreator;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.JsonDeserializer;
import org.codehaus.jackson.map.annotate.JsonDeserialize;

@XmlRootElement
@XmlAccessorType(value = XmlAccessType.FIELD)
@JsonAutoDetect
@JsonIgnoreProperties
public class ShoppingBasket implements Serializable{

	private Store store;
	private int orderNumber;
	private ShoppingCustomerInfo shoppingCustomerInfo;
	private ShoppingCart shoppingCart;
	private List<ShoppingCartItems> shoppingCartItems = null;
	private Map<Integer,String> productIdMapping = new HashMap<Integer, String>();

	public int getOrderNumber() {
		return orderNumber;
	}
	
	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}

	public Store getStore() {
		return store;
	}

	public void setStore(Store store) {
		this.store = store;
	}

	public ShoppingCustomerInfo getShoppingCustomerInfo() {
		return shoppingCustomerInfo;
	}
	
	public void setShoppingCustomerInfo(
			ShoppingCustomerInfo shoppingCustomerInfo) {
		this.shoppingCustomerInfo = shoppingCustomerInfo;
	}

	public ShoppingCart getShoppingCart() {
		return shoppingCart;
	}
	
	public void setShoppingCart(ShoppingCart shoppingCart) {
		this.shoppingCart = shoppingCart;
	}

	@XmlList
	@JsonProperty("shoppingCartItems") 
	public List<ShoppingCartItems> getShoppingCartItems() {
		return shoppingCartItems;
	}

	@XmlList
	@JsonProperty("shoppingCartItems")
	public void setShoppingCartItems(List<ShoppingCartItems> shoppingCartItems) {
		this.shoppingCartItems = shoppingCartItems;
	}

	@Override
	public String toString() {
		return "ShoppingBasket [store=" + store + ", orderNumber="
				+ orderNumber + ", shoppingCart=" + shoppingCart
				+ ", shoppingCustomerInfo=" + shoppingCustomerInfo
				+ ", shoppingCartItems=" + shoppingCartItems + "]";
	}

	public Map<Integer,String> getProductIdMapping() {
		return productIdMapping;
	}

	public void setProductIdMapping(Map<Integer,String> productIdMapping) {
		this.productIdMapping = productIdMapping;
	}
}
