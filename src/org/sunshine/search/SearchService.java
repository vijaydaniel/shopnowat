package org.sunshine.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.sunshine.domain.Product;
import org.sunshine.domain.Store;

@Service
public class SearchService {

	@Autowired
	private SearchDataAccess searchDataAccess;
	
	public void setSearchDataAccess(SearchDataAccess searchDataAccess){
		this.searchDataAccess = searchDataAccess;
	}

	public List<Product> getMatchingProducts(Integer storeid, String searchString) {
		return searchDataAccess.getMatchingProducts(storeid, searchString);
	}

	public List<Product> getMatchingProductsAcross(String name) {
		return searchDataAccess.getMatchingProductsAcross(name);
	}

	public List<Store> getMatchingStores(String name) {
		return searchDataAccess.getMatchingStores(name);
	}

}
