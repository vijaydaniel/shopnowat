package org.sunshine.domain;

import java.io.Serializable;
import java.util.ArrayList;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonAutoDetect;
import org.codehaus.jackson.annotate.JsonCreator;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonAutoDetect
@Entity
@Table(name="shopping_cart_items")
public class ShoppingCartItems implements Serializable{

	private int id;
	private int cart_id;
	private int product_id;
	private int item_quantity;

	@JsonCreator
	public ShoppingCartItems(){
		
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name="cart_id")
	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}

	@Column(name="product_id")
	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	@Column(name="item_quantity")
	public int getItem_quality() {
		return item_quantity;
	}

	public void setItem_quality(int item_quality) {
		this.item_quantity = item_quality;
	}
	
	@Override
	public String toString() {
		StringBuffer buffer = new StringBuffer();
		buffer.append("ID: "+ id);
		buffer.append("Cart_id:" + cart_id);
		buffer.append("Product_id:" + product_id);
		buffer.append("Item_Quantity:"+ item_quantity);
		return buffer.toString();
	}

}
