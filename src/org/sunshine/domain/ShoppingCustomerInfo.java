package org.sunshine.domain;

import java.io.Serializable;

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
@Table(name="shopping_customer_info")
public class ShoppingCustomerInfo implements Serializable{

	private int id;
	private int cartId;
	private String name;
	private String phoneNumber;
	private String alternatePhoneNumber;
	private String emailId;
	private String address;

	@JsonCreator
	public ShoppingCustomerInfo(){
		
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
		return cartId;
	}

	public void setCart_id(int cart_id) {
		this.cartId = cart_id;
	}

	@Column(name="name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name="phone_number")
	public String getPhone_number() {
		return phoneNumber;
	}

	public void setPhone_number(String phone_number) {
		this.phoneNumber = phone_number;
	}

	@Column(name="alternate_phone_number")
	public String getAlternate_phone_number() {
		return alternatePhoneNumber;
	}

	public void setAlternate_phone_number(String alternate_phone_number) {
		this.alternatePhoneNumber = alternate_phone_number;
	}

	@Column(name="email_id")
	public String getEmail_id() {
		return emailId;
	}

	public void setEmail_id(String email_id) {
		this.emailId = email_id;
	}

	@Column(name="address")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	@Override
	public String toString() {
		StringBuffer buffer = new StringBuffer();
		buffer.append("ID:"+ id);
		buffer.append("Cart_id:" + cartId);
		buffer.append("Name:" + name);
		buffer.append("Phone_Number:"+ phoneNumber);
		buffer.append("Alternate_Phone_Number:"+ alternatePhoneNumber);
		buffer.append("Email_ID:"+ emailId);
		buffer.append("Address:" + address);
		return buffer.toString();
	}

}
