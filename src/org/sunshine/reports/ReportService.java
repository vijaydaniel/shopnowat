package org.sunshine.reports;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReportService {

	@Autowired
	private ReportDataAccess reportDataAccess;
	
	public List<OrderReport> getAllOpenCarts(String storeid) {
		return reportDataAccess.getAllOpenOrders(storeid);
		
	}

	public List<OrderReport> getAllCarts(String storeid) {
		return reportDataAccess.getAllOrders(storeid);
	}
	
	public List<ItemsInCartReport> getAllInCartReports(String cartid) {
		return reportDataAccess.getAllItemsInCart(cartid);
	}
	
	public List<OrderReport> getAllOrdersAcrossStores() {
		return reportDataAccess.getAllOrdersAcrossStores();
		
	}

	public List<OrderReport> getAllOpenOrdersAcrossStores() {
		return reportDataAccess.getAllOpenOrdersAcrossStores();
	}
	
	public void setReportDataAccess(ReportDataAccess reportDataAccess){
		this.reportDataAccess = reportDataAccess;
	}

	public List<DueReport> getDues() {
		return reportDataAccess.getDues();
	}

	public List<DueDetailsReport> getDuesDetails(String storeId) {
		return reportDataAccess.getDuesDetails(storeId);
	}

	public List<DueReport> getPaidService() {
		return reportDataAccess.getPaidServices();
	}

	public List<DueReport> getServiceByStatus(String status) {
		return reportDataAccess.getServiceByStatus(status);
	}

	public List<PaymentDues> getAllPaymentDues() {
		return reportDataAccess.getPaymentDues();
	}

	public List<DueReport> getServiceByStoreandStatus(String storeId,
			String status) {
		return reportDataAccess.getServiceByStoreandStatus(storeId,status);
	}

	public List<DueDetailsReport> getServiceByStoreandStatusDetails(
			String storeId) {
		return reportDataAccess.getServiceByStoreandStatusDetails(storeId);
	}

}
