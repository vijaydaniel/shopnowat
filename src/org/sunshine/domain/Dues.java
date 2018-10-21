package org.sunshine.domain;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "dues")
public class Dues implements Serializable {
	private int id;
	private int storeId;
	private int amountDue = 0;
	private double commissionPercentage;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "store_id")
	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	@Column(name = "amount_due")
	public int getAmountDue() {
		return amountDue;
	}

	public void setAmountDue(int amountDue) {
		this.amountDue = amountDue;
	}

	@Column(name = "commission_percentage")
	public double getCommissionPercentage() {
		return commissionPercentage;
	}

	public void setCommissionPercentage(double commissionPercentage) {
		this.commissionPercentage = commissionPercentage;
	}

	@Override
	public String toString() {
		return "Dues [id=" + id + ", storeId=" + storeId + ", amountDue="
				+ amountDue + ", commissionPercentage=" + commissionPercentage
				+ "]";
	}

}