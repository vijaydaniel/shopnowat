package org.sunshine.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.sunshine.database.MyBatisUtil;
import org.sunshine.domain.Store;

@Repository
public class StoreDataAccess {

	public List<Store> getAllStores() {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
			return storeMapper.getAllStores();
		} finally {
			sqlSession.close();
		}
	}
	
	public List<Store> getStoresInLocation(String location){
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
			return storeMapper.getAllStoresInLocation(location);
		} finally {
			sqlSession.close();
		}
	}

	public List<Store> getStoresInLocationSearch(String location, String store) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
			return storeMapper.getAllStoresInLocationSearch(location,store);
		} finally {
			sqlSession.close();
		}
	}
	
	public List<Store> getStoresInLocationSearch(String name) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
			return storeMapper.getAllStoresByName(name);
		} finally {
			sqlSession.close();
		}
	}

	public List<Store> getAllStoresByName(String name) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
			return storeMapper.getAllStoresByName("%"+name+"%");
		} finally {
			sqlSession.close();
		}
	}

	public List<Store> getStoreById(String storeId) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
			return storeMapper.getStoreById(storeId);
		} finally {
			sqlSession.close();
		}
	}
}