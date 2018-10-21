package org.sunshine.reports;


public class DueReport {

	private int id;
	private String name;
	private String phoneNumber;
	private String address;
	private float totalAmount;

	@Override
	public String toString() {
		return "DueReport [id=" + id + ", name=" + name + ", phoneNumber="
				+ phoneNumber + ", address=" + address + ", totalAmount="
				+ totalAmount + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phone_number) {
		this.phoneNumber = phone_number;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public float getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(float total_amount) {
		this.totalAmount = total_amount;
	}
}
