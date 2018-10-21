package org.sunshine.store;

import java.util.List;

import org.sunshine.domain.Store;

public interface StoreMapper {

	public List<Store> getAllStores();

	public List<Store> getAllStoresInLocation(String location);

	public List<Store> getAllStoresInLocationSearch(String location,
			String store);
	
	public List<Store> getAllStoresInLocationSearch(String name);

	public List<Store> getAllStoresByName(String name);

	public List<Store> getStoreById(String storeId);

}
