package org.sunshine.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.sunshine.database.HibernateDataAccess;
import org.sunshine.domain.Dues;
import org.sunshine.domain.Store;

@Service
public class StoreService {

	@Autowired
	private HibernateDataAccess hibernateDataAccess;
	@Autowired
	private StoreDataAccess storeDataAccess;

	public void setStoreDataAccess(StoreDataAccess storeDataAccess) {
		this.storeDataAccess = storeDataAccess;
	}

	public void setHibernateDataAccess(HibernateDataAccess hibernateDataAccess) {
		this.hibernateDataAccess = hibernateDataAccess;
	}

	public int addStore(Store command) {
		hibernateDataAccess.saveObject(command);
		return command.getId();
	}

	public void editStore(Object command) {
		hibernateDataAccess.updateObject(command);
	}

	public void deleteStore(Object command) {
		hibernateDataAccess.deleteObject(command);
	}

	public List<Store> getStores() {
		return storeDataAccess.getAllStores();
	}
	
	public List<Store> getStoresByName(String name) {
		return storeDataAccess.getAllStoresByName(name);
	}
	
	public List<Store> getStoresInLocation(String location) {
		return storeDataAccess.getStoresInLocation(location);
	}
	
	public List<Store> getStoresInLocationSearch(String location,String store) {
		return storeDataAccess.getStoresInLocationSearch(location,store);
	}
	
	public List<Store> getStoresInLocationSearch(String store) {
		return storeDataAccess.getStoresInLocationSearch(store);
	}

	public List<Store> getStoreById(String storeId) {
		return storeDataAccess.getStoreById(storeId);
	}
	
	public String getStoreNameById(String storeId) {
		return storeDataAccess.getStoreById(storeId).get(0).getName();
	}

	public void addDueDetails(Dues dues) {
		hibernateDataAccess.saveObject(dues);
	}
}
