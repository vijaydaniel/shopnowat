package org.sunshine.user;

import java.util.List;

import org.sunshine.domain.ShoppingCustomerInfo;
import org.sunshine.domain.User;


public interface UserMapper {
	
	 public List<User> getAllUsers();

	public User getUserDetails(String name);

	public ShoppingCustomerInfo getUserDetailsByCartId(String cartId);

}
