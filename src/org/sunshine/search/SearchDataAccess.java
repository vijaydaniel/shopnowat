package org.sunshine.search;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.sunshine.database.MyBatisUtil;
import org.sunshine.database.MybatisDataAccess;
import org.sunshine.domain.Product;
import org.sunshine.domain.Store;

@Repository
public class SearchDataAccess {

	public List<Product> getMatchingProducts(Integer storeid, String searchString) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			SearchMapper searchMapper = sqlSession
					.getMapper(SearchMapper.class);
			return searchMapper.getMatchingProducts(storeid,"%"+searchString+"%");
		} finally {
			sqlSession.close();
		}
	}
	
	public List<Product> getMatchingProductsAcross(String name) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			SearchMapper searchMapper = sqlSession
					.getMapper(SearchMapper.class);
			return searchMapper.getMatchingProductsAcross("%"+name+"%");
		} finally {
			sqlSession.close();
		}
	}

	public List<Store> getMatchingStores(String name) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			SearchMapper searchMapper = sqlSession
					.getMapper(SearchMapper.class);
			return searchMapper.getMatchingStores("%"+name+"%");
		} finally {
			sqlSession.close();
		}
	}

}