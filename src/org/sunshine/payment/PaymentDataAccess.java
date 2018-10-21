package org.sunshine.payment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.sunshine.database.MyBatisUtil;
import org.sunshine.domain.Dues;
import org.sunshine.reports.PaymentDues;

@Repository
public class PaymentDataAccess {

	public void updatePayment(Dues dues) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			PaymentMapper paymentMapper = sqlSession.getMapper(PaymentMapper.class);
			System.out.println("payment details:- store ID="+dues.getStoreId()+"Amount Due="+dues.getAmountDue()+"Commission Percentage="+dues.getCommissionPercentage());
			paymentMapper.updatePayment(dues.getStoreId(),dues.getAmountDue(), dues.getCommissionPercentage());
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
		
	}

	public void updateShopperPaymentStatus(String storeId, String status) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			PaymentMapper paymentMapper = sqlSession.getMapper(PaymentMapper.class);
			paymentMapper.updateShopperPaymentStatus(storeId,status);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	public List<PaymentDues> getPaymentDuesForStore(String storeId) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			PaymentMapper paymentMapper = sqlSession.getMapper(PaymentMapper.class);
			return paymentMapper.getPaymentDuesForStore(storeId);
		} finally {
			sqlSession.close();
		}
	}
	
}