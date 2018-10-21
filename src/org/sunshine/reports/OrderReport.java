package org.sunshine.reports;

import java.util.Date;

public class OrderReport {

	private int cart_id;
	private int store_id;
	private Date create_date;
	private String name;
	private String phone_number;
	private String alternate_phone_number;
	private String email_id;
	private String address;
	private float total_amount;
	private String purchase_status;
	private String eshopper_status;
	
	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}

	public int getStore_id() {
		return store_id;
	}

	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getAlternate_phone_number() {
		return alternate_phone_number;
	}

	public void setAlternate_phone_number(String alternate_phone_number) {
		this.alternate_phone_number = alternate_phone_number;
	}

	public String getEmail_id() {
		return email_id;
	}

	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public float getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(float total_amount) {
		this.total_amount = total_amount;
	}

	public String getPurchase_status() {
		return purchase_status;
	}

	public void setPurchase_status(String purchase_status) {
		this.purchase_status = purchase_status;
	}

	public String getEshopper_status() {
		return eshopper_status;
	}

	public void setEshopper_status(String eshopper_status) {
		this.eshopper_status = eshopper_status;
	}

}
