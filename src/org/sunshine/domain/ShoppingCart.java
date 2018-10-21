package org.sunshine.domain;

import java.io.Serializable;
import java.util.Date;

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
@JsonIgnoreProperties
@Entity
@Table(name="shopping_carts")
public class ShoppingCart implements Serializable{

	private int cart_id;
	private String session_id;
	private int store_id;
	private Date create_date = new Date();;
	private float total_amount;
	private String purchase_status;
	private String eshopper_status;
	
	@JsonCreator
	public ShoppingCart(){
		
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="cart_id")
	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}

	@Column(name="session_id")
	public String getSession_id() {
		return session_id;
	}

	public void setSession_id(String session_id) {
		this.session_id = session_id;
	}

	@Column(name="store_id")
	public int getStore_id() {
		return store_id;
	}

	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}

	@Column(name="create_date")
	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		if (create_date == null) {
			Date date = new Date();
			this.create_date = date;
		} else {
			this.create_date = create_date;
		}
	}

	@Column(name="total_amount")
	public float getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(float total_amount) {
		this.total_amount = total_amount;
	}

	@Column(name="purchase_status")
	public String getPurchase_status() {
		return purchase_status;
	}

	public void setPurchase_status(String purchase_status) {
		this.purchase_status = purchase_status;
	}

	@Column(name="eshopper_status")
	public String getEshopper_status() {
		return eshopper_status;
	}

	public void setEshopper_status(String eshopper_status) {
		this.eshopper_status = eshopper_status;
	}

	@Override
	public String toString() {
		return "ShoppingCart [cart_id=" + cart_id + ", session_id="
				+ session_id + ", store_id=" + store_id + ", create_date="
				+ create_date + ", total_amount=" + total_amount
				+ ", purchase_status=" + purchase_status + ", eshopper_status="
				+ eshopper_status + "]";
	}

}
