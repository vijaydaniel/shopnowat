package org.sunshine.payment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.sunshine.database.HibernateDataAccess;
import org.sunshine.domain.Dues;
import org.sunshine.reports.PaymentDues;

@Service
public class PaymentService {

	private static final long serialVersionUID = 1L;

	@Autowired
	private PaymentDataAccess paymentDataAccess;
	@Autowired
	private HibernateDataAccess hibernateDataAccess;

	public void updatePayment(Dues dues) {
		paymentDataAccess.updatePayment(dues);
	}

	public void updateShopperPaymentStatus(String storeId, String status) {
		paymentDataAccess.updateShopperPaymentStatus(storeId,status);
	}

	public List<PaymentDues> getPaymentDuesForStore(String storeId) {
		return paymentDataAccess.getPaymentDuesForStore(storeId);
	}

}