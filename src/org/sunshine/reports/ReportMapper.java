package org.sunshine.reports;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.sunshine.domain.ShoppingCart;

public interface ReportMapper {

	/* Methods to be used by vendors view perspective */
	public List<OrderReport> getAllOrders(@Param("storeid") String storeid);

	public List<OrderReport> getAllOpenOrders(@Param("storeid") String storeid);

	public List<ItemsInCartReport> getAllItemsInCart(
			@Param("cartid") String cartid);
	
	/* Methods to be used by Admin view perspective */
	public List<OrderReport> getAllOrdersAcrossStores();

	public List<OrderReport> getAllOpenOrdersAcrossStores();

	public List<ShoppingCart> getShoppingCart(String cartid);

	public List<DueReport> getDues();

	public List<DueDetailsReport> getDuesDetails(String storeId);

	public List<DueReport> getPaidService();

	public List<DueReport> getServiceByStatus(String status);

	public List<PaymentDues> getAllPaymentDues();

	public List<DueReport> getServiceByStoreandStatus(String storeId,
			String status);

	public List<DueDetailsReport> getServiceByStoreandStatusDetails(
			String storeId);

	public List<OrderReport> getServiceByStoreandStatusDetails(String storeid, String string);

	public void setCartPurchaseStatus(String cartId, String status);

}
