package org.sunshine.product;

import java.util.List;

import org.sunshine.domain.Product;
import org.sunshine.domain.ProductImage;


public interface ProductMapper {
	
	 public void insertProduct(Product user);

	 public Product getProductById(Integer id);

	 public List<Product> getSelectedProducts(Integer storeid);
	 
	 public List<Product> getAllProducts();

	 public void updateProduct(Product product);

	 public void deleteProduct(Integer id);

	public List<Product> getSelectedProductsByName(Integer storeid,
			String product);
	
	public List<Product> getProductsByStoreAndCategory(Integer storeid, Integer categoryid);
	
	public List<Product> getProductsByCategoryAndSubcategory(Integer storeid, Integer category_id, Integer subcategory_id);

	public List<Product> getProductsByCategory(String storeIdentity,
			String category, String offset, String rowCount);

	public List<ProductImage> getCommonAndSpecificProductImages(String storeId,
			String offset, String rowCount);

	public List<ProductImage> getCommonAndSpecificProductImagesbySearch(String storeId,
			String offset, String rowcount, String searchString);
	
}
