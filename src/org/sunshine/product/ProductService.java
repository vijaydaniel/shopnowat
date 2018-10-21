package org.sunshine.product;

import java.io.File;
import java.io.FileFilter;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.sunshine.database.HibernateDataAccess;
import org.sunshine.domain.Product;
import org.sunshine.domain.ProductImage;

@Service
public class ProductService {

	private static final long serialVersionUID = 1L;
	@Autowired
	private ProductDataAccess productDataAccess;
	@Autowired
	private HibernateDataAccess hibernateDataAccess;

	public void addProduct(Product product) {
		hibernateDataAccess.saveObject(product);
	}

	public void editProduct(Product product) {
		System.out.println(product);
		hibernateDataAccess.updateObject(product);
	}

	public void deleteProduct(Product product) {
		hibernateDataAccess.deleteObject(product);
	}

	public List<Product> getProducts() {
		return productDataAccess.getAllProducts();
	}

	public List<Product> getSelectedProducts(String store) {
		int storeid = Integer.parseInt(store);
		return productDataAccess.getSelectedProducts(storeid);
	}

	public List<Product> getProducts(String store, String category_id) {
		int storeid = Integer.parseInt(store);
		int categoryid = Integer.parseInt(category_id);
		return productDataAccess.getProductsByStoreAndCategory(storeid,
				categoryid);
	}

	public List<Product> getProduct(String store, String category_id,
			String subcategory_id) {
		int storeid = Integer.parseInt(store);
		int categoryid = Integer.parseInt(category_id);
		int subcategoryid = Integer.parseInt(subcategory_id);
		return productDataAccess.getProduct(storeid, categoryid, subcategoryid);
	}

	public List<Product> getSelectedProductsByName(String store, String product) {
		int storeid = Integer.parseInt(store);
		return productDataAccess.getSelectedProductsByName(storeid, product);
	}

	public void setProductDataAccess(ProductDataAccess productDataAccess) {
		this.productDataAccess = productDataAccess;
	}

	public void setHibernateDataAccess(HibernateDataAccess hibernateDataAccess) {
		this.hibernateDataAccess = hibernateDataAccess;
	}

	public List<String> getProductImages(String imageDirectory) {
		File folder = new File(imageDirectory + "/img/");
		System.out.println(folder.getAbsolutePath());
		List<String> files = new ArrayList<String>();
		for (final File fileEntry : folder.listFiles()) {
			files.add(fileEntry.getName());
			System.out.println(fileEntry.getName());
		}
		return files;
	}

	public List<String> getProductImages(String imageDirectory,
			final String searchString) {
		File folder = new File(imageDirectory + "/img/");
		List<String> files = new ArrayList<String>();
		for (final File fileEntry : folder.listFiles(new FileFilter() {
			public boolean accept(File file) {
				// return
				// Pattern.compile(^searchString).matcher(file.getName()).matches();
				return file.getName().contains(searchString);
			}
		})) {
			files.add(fileEntry.getName());
			System.out.println(fileEntry.getName());
		}
		return files;
	}

	public List<Product> getProducts(String storeIdentity, String category,
			String offset, String rowCount) {
		category = "'" + category + "%'";
		System.out.println(category);
		return productDataAccess.getProduct(storeIdentity, category, offset,
				rowCount);
	}

	public List<ProductImage> getCommonAndSpecificProductImages(String storeId, String offset, String rowCount) {
		return productDataAccess.getCommonAndSpecificProductImages(storeId,offset, rowCount);
	}

	public List<ProductImage> getCommonAndSpecificProductImages(String storeId, String offset, String rowcount, String searchString) {
		searchString = "'%"+searchString+"%'";
		return productDataAccess.getCommonAndSpecificProductImages(storeId,offset, rowcount, searchString);
	}

	public void addProductImage(ProductImage productImage) {
		hibernateDataAccess.saveObject(productImage);
	}

}