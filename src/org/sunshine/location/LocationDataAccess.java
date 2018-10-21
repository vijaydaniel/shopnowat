package org.sunshine.location;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.sunshine.database.MyBatisUtil;
import org.sunshine.domain.Location;

@Repository
public class LocationDataAccess {
	public List<Location> getAllLocations() {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			LocationMapper locationMapper = (LocationMapper) sqlSession
					.getMapper(LocationMapper.class);
			return locationMapper.getAllLocations();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			sqlSession.close();
		}
	}

	public List<Location> getAllLocations(String name) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			LocationMapper locationMapper = (LocationMapper) sqlSession
					.getMapper(LocationMapper.class);
			return locationMapper.getAllLocationsByName("%"+name+"%");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			sqlSession.close();
		}
	}

	public void updateLocationInShoppingCart(Location location,String previousName) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			LocationMapper locationMapper = (LocationMapper) sqlSession
					.getMapper(LocationMapper.class);
			locationMapper.updateLocationInShoppingCart(location.getName(),previousName);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			sqlSession.close();
		}
	}

}