package org.sunshine.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.sunshine.database.HibernateDataAccess;
import org.sunshine.domain.ShoppingBasket;
import org.sunshine.domain.ShoppingCart;
import org.sunshine.domain.ShoppingCartItems;
import org.sunshine.domain.ShoppingCustomerInfo;
import org.sunshine.jms.JmsQueueSender;
import org.sunshine.reports.ItemsInCartReport;
import org.sunshine.reports.OrderReport;
import org.sunshine.reports.ReportDataAccess;

@Service
public class OrderService {

	@Autowired
	private HibernateDataAccess hibernateDataAccess;
	
	@Autowired
	private ReportDataAccess reportDataAccess;

	public void setHibernateDataAccess(HibernateDataAccess hibernateDataAccess) {
		this.hibernateDataAccess = hibernateDataAccess;
	}

	public ReportDataAccess getReportDataAccess() {
		return reportDataAccess;
	}

	public void setReportDataAccess(ReportDataAccess reportDataAccess) {
		this.reportDataAccess = reportDataAccess;
	}

	public List<OrderReport> getOrderSummaryForStore(String storeId){
		return reportDataAccess.getAllOpenOrders(storeId);
	}
	
	public List<ItemsInCartReport> getShoppingCartItems(String cartId){
		return reportDataAccess.getAllItemsInCart(cartId);
	}
	
	public ShoppingCart getShoppingCart(String cartId){
		return reportDataAccess.getShoppingCart(cartId);
	}

	public List<OrderReport> getOrdersBasedOnPurchaseStatus(String storeid,String status) {
		return reportDataAccess.getOrdersBasedOnPurchaseStatus(storeid,status);
	}

	public void setCartPurchaseStatus(String cartId, String status) {
		reportDataAccess.setCartPurchaseStatus(cartId,status);
	}
}