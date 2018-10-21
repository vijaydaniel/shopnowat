package org.sunshine.reports;

public class PaymentDues {

	private int id = 0;
	private String name = "";
	private String address = "";
	private String location = "";
	private String phoneNumber = "";
	private Double totalAmount;
	private Double totalDues;
	private Double commissionPercentage;

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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public Double getTotalDues() {
		return totalDues;
	}

	public void setTotalDues(Double totalDues) {
		this.totalDues = totalDues;
	}

	@Override
	public String toString() {
		return "PaymentDues [id=" + id + ", name=" + name + ", address="
				+ address + ", location=" + location + ", phoneNumber="
				+ phoneNumber + ", totalAmount=" + totalAmount + ", totalDues="
				+ totalDues + "]";
	}

	public Double getCommissionPercentage() {
		return commissionPercentage;
	}

	public void setCommissionPercentage(Double commissionPercentage) {
		this.commissionPercentage = commissionPercentage;
	}

}
