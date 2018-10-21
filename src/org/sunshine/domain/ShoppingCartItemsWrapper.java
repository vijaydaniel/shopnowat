package org.sunshine.domain;

import java.util.ArrayList;

import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.annotate.JsonAutoDetect;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@XmlRootElement
@JsonAutoDetect
@JsonIgnoreProperties
public class ShoppingCartItemsWrapper extends ArrayList{

	
	/*private ShoppingCartItems shoppingCartItems = null;

	public ShoppingCartItems getShoppingCartItems() {
		return shoppingCartItems;
	}

	public void setShoppingCartItems(ShoppingCartItems shoppingCartItems) {
		
		this.shoppingCartItems = shoppingCartItems;
	}*/
	
}
