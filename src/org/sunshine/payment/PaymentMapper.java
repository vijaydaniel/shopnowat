package org.sunshine.payment;

import java.util.List;

import org.sunshine.reports.PaymentDues;


public interface PaymentMapper {

	void updatePayment(int storeId, int amountDue, double commissionPercentage);

	void updateShopperPaymentStatus(String storeId, String status);

	List<PaymentDues> getPaymentDuesForStore(String storeId);

}
