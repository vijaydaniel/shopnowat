package org.sunshine.user;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.sunshine.database.MyBatisUtil;
import org.sunshine.database.MybatisDataAccess;
import org.sunshine.domain.ShoppingCustomerInfo;
import org.sunshine.domain.User;

@Repository
public class UserDataAccess {

	public List<User> getAllUsers() {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			return userMapper.getAllUsers();
		} finally {
			sqlSession.close();
		}
	}

	public String getUserPassword(String name) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			User user = userMapper.getUserDetails(name);
			return user.getPassword();
		} finally {
			sqlSession.close();
		}
	}

	public String getUserRoleId(String name) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			User user = userMapper.getUserDetails(name);
			return Integer.toString(user.getRoleId());
		} finally {
			sqlSession.close();
		}
	}

	public String getStoreId(String userName) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			User user = userMapper.getUserDetails(userName);
			return Integer.toString(user.getStoreId());
		} finally {
			sqlSession.close();
		}
	}
	
	public ShoppingCustomerInfo getUser(String cartId) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			ShoppingCustomerInfo user = userMapper.getUserDetailsByCartId(cartId);
			return user;
		} finally {
			sqlSession.close();
		}
	}
	
}