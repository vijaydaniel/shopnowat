package org.sunshine.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private String password;
	private String phoneNumber;
	private String alternatePhoneNumber;
	private String emailId;
	private int roleId;
	private int storeId;
	private String address;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "password")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "phone_number")
	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phone_number) {
		this.phoneNumber = phone_number;
	}

	@Column(name = "alternate_phone_number")
	public String getAlternatePhoneNumber() {
		return alternatePhoneNumber;
	}

	public void setAlternatePhoneNumber(String alternate_phone_number) {
		this.alternatePhoneNumber = alternate_phone_number;
	}

	@Column(name = "email_id")
	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String email_id) {
		this.emailId = email_id;
	}

	@Column(name = "role_id")
	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int role_id) {
		this.roleId = role_id;
	}

	@Column(name = "store_id")
	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeid) {
		this.storeId = storeid;
	}

	@Column(name = "address")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String toString() {
		StringBuffer buffer = new StringBuffer();
		buffer.append("ID: " + id + ";");
		buffer.append("Name: " + name + ";");
		buffer.append("Password: " + password + ";");
		buffer.append("phone_number: " + getPhoneNumber());
		buffer.append("Alt phone_number: " + alternatePhoneNumber);
		buffer.append("Email_id: " + emailId);
		buffer.append("Storeid: " + storeId);
		buffer.append("Address: " + address);
		return buffer.toString();
	}

}