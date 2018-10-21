package org.sunshine.user;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.sunshine.database.HibernateDataAccess;
import org.sunshine.domain.ShoppingCustomerInfo;
import org.sunshine.domain.User;

@Service
public class UserService {

	private static final long serialVersionUID = 1L;

	@Autowired
	private UserDataAccess userDataAccess;
	@Autowired
	private HibernateDataAccess hibernateDataAccess;

	public void addUser(User user) {
		hibernateDataAccess.saveObject(user);
	}

	public void editUser(User user) {
		hibernateDataAccess.updateObject(user);
	}

	public void deleteUser(User user) {
		hibernateDataAccess.deleteObject(user);
	}

	public List<User> getUsers() {
		return userDataAccess.getAllUsers();
	}

	public void setUserDataAccess(UserDataAccess userDataAccess) {
		this.userDataAccess = userDataAccess;
	}

	public void setHibernateDataAccess(HibernateDataAccess hibernateDataAccess) {
		this.hibernateDataAccess = hibernateDataAccess;
	}

	public String authenticateUser(User user) {
		String passwdFromDB = userDataAccess.getUserPassword(user.getName());
		String role_id = userDataAccess.getUserRoleId(user.getName());
		if (passwdFromDB.equals(user.getPassword())) {
			return role_id;
		} else {
			return "false";
		}
	}

	public String getStoreId(String userName) {
		String storeId = userDataAccess.getStoreId(userName);
		return storeId;
	}

	public List<ShoppingCustomerInfo> getUserDetails(String cartId) {
		ShoppingCustomerInfo user = userDataAccess.getUser(cartId);
		ArrayList<ShoppingCustomerInfo> info = new ArrayList<ShoppingCustomerInfo>();
		info.add(user);
		return info;
	}

}