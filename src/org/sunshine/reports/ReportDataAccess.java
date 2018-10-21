package org.sunshine.reports;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.sunshine.database.MyBatisUtil;
import org.sunshine.database.MybatisDataAccess;
import org.sunshine.domain.ShoppingCart;

@Repository
public class ReportDataAccess {

	public List<OrderReport> getAllOrders(String storeid) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ReportMapper orderMapper = sqlSession.getMapper(ReportMapper.class);
			return orderMapper.getAllOrders(storeid);
		} finally {
			sqlSession.close();
		}
	}

	public List<OrderReport> getAllOpenOrders(String storeid) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ReportMapper orderMapper = sqlSession.getMapper(ReportMapper.class);
			return orderMapper.getAllOpenOrders(storeid);
		} finally {
			sqlSession.close();
		}
	}

	public List<ItemsInCartReport> getAllItemsInCart(String cartid) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ReportMapper orderMapper = sqlSession.getMapper(ReportMapper.class);
			return orderMapper.getAllItemsInCart(cartid);
		} finally {
			sqlSession.close();
		}
	}

	public ShoppingCart getShoppingCart(String cartid) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ReportMapper orderMapper = sqlSession.getMapper(ReportMapper.class);
			List<ShoppingCart> shoppingCartList = orderMapper
					.getShoppingCart(cartid);
			System.out.println(shoppingCartList);
			return shoppingCartList.get(0);
		} finally {
			sqlSession.close();
		}
	}

	public List<OrderReport> getAllOrdersAcrossStores() {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ReportMapper orderMapper = sqlSession.getMapper(ReportMapper.class);
			return orderMapper.getAllOrdersAcrossStores();
		} finally {
			sqlSession.close();
		}
	}

	public List<OrderReport> getAllOpenOrdersAcrossStores() {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ReportMapper orderMapper = sqlSession.getMapper(ReportMapper.class);
			return orderMapper.getAllOpenOrdersAcrossStores();
		} finally {
			sqlSession.close();
		}
	}

	public List<DueReport> getDues() {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ReportMapper reportMapper = sqlSession
					.getMapper(ReportMapper.class);
			return reportMapper.getDues();
		} finally {
			sqlSession.close();
		}
	}

	public List<DueDetailsReport> getDuesDetails(String storeId) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ReportMapper reportMapper = sqlSession
					.getMapper(ReportMapper.class);
			return reportMapper.getDuesDetails(storeId);
		} finally {
			sqlSession.close();
		}
	}

	public List<DueReport> getPaidServices() {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ReportMapper reportMapper = sqlSession
					.getMapper(ReportMapper.class);
			return reportMapper.getPaidService();
		} finally {
			sqlSession.close();
		}
	}

	public List<DueReport> getServiceByStatus(String status) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ReportMapper reportMapper = sqlSession
					.getMapper(ReportMapper.class);
			return reportMapper.getServiceByStatus(status);
		} finally {
			sqlSession.close();
		}
	}

	public List<PaymentDues> getPaymentDues() {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ReportMapper reportMapper = sqlSession
					.getMapper(ReportMapper.class);
			return reportMapper.getAllPaymentDues();
		} finally {
			sqlSession.close();
		}
	}

	public List<DueReport> getServiceByStoreandStatus(String storeId,
			String status) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ReportMapper reportMapper = sqlSession
					.getMapper(ReportMapper.class);
			return reportMapper.getServiceByStoreandStatus(storeId,status);
		} finally {
			sqlSession.close();
		}
	}

	public List<DueDetailsReport> getServiceByStoreandStatusDetails(
			String storeId) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ReportMapper reportMapper = sqlSession
					.getMapper(ReportMapper.class);
			return reportMapper.getServiceByStoreandStatusDetails(storeId);
		} finally {
			sqlSession.close();
		}
	}

	public List<OrderReport> getOrdersBasedOnPurchaseStatus(String storeid,String status) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ReportMapper orderMapper = sqlSession.getMapper(ReportMapper.class);
			return orderMapper.getServiceByStoreandStatusDetails(storeid,status);
		} finally {
			sqlSession.close();
		}
	}

	public void setCartPurchaseStatus(String cartId, String status) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ReportMapper orderMapper = sqlSession.getMapper(ReportMapper.class);
			orderMapper.setCartPurchaseStatus(cartId,status);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

}