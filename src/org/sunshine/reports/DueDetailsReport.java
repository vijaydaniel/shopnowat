package org.sunshine.reports;

public class DueDetailsReport {

	private int cartId;
	private String createDate;
	private String totalAmount;
	private String purchaseStatus;

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getPurchaseStatus() {
		return purchaseStatus;
	}

	public void setPurchaseStatus(String purchaseStatus) {
		this.purchaseStatus = purchaseStatus;
	}

	@Override
	public String toString() {
		return "DueDetailsReport [cartId=" + cartId + ", createDate="
				+ createDate + ", totalAmount=" + totalAmount
				+ ", purchaseStatus=" + purchaseStatus + "]";
	}
}
