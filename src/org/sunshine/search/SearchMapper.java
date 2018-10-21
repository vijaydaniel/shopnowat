package org.sunshine.search;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.sunshine.domain.Product;
import org.sunshine.domain.Store;

public interface SearchMapper {

	public List<Product> getMatchingProducts(@Param("storeid") Integer storeid,@Param("searchString") String searchString);

	public List<Product> getMatchingProductsAcross(@Param("name") String name);
	
	public List<Store> getMatchingStores(@Param("name") String name);

}
