package org.sunshine.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.sunshine.database.MyBatisUtil;
import org.sunshine.domain.Product;
import org.sunshine.domain.ProductImage;

@Repository
public class ProductDataAccess {

	public void insertProduct(Product product) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ProductMapper productMapper = sqlSession
					.getMapper(ProductMapper.class);
			productMapper.insertProduct(product);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	public Product getProductById(Integer id) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ProductMapper productMapper = sqlSession
					.getMapper(ProductMapper.class);
			return productMapper.getProductById(id);
		} finally {
			sqlSession.close();
		}
	}

	public List<Product> getSelectedProducts(Integer storeid) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ProductMapper productMapper = sqlSession
					.getMapper(ProductMapper.class);
			return productMapper.getSelectedProducts(storeid);
		} finally {
			sqlSession.close();
		}
	}

	public List<Product> getSelectedProductsByName(Integer storeid, String name) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ProductMapper productMapper = sqlSession
					.getMapper(ProductMapper.class);
			return productMapper.getSelectedProductsByName(storeid,name);
		} finally {
			sqlSession.close();
		}
	}
	
	public List<Product> getAllProducts() {
		
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
			return productMapper.getAllProducts();
		} finally {
			sqlSession.close();
		}
	}

	public void updateProduct(Product product) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ProductMapper productMapper = sqlSession
					.getMapper(ProductMapper.class);
			productMapper.updateProduct(product);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}

	}

	public void deleteProduct(Integer id) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ProductMapper productMapper = sqlSession
					.getMapper(ProductMapper.class);
			productMapper.deleteProduct(id);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}

	}

	public List<Product> getProductsByStoreAndCategory(int storeid, int categoryid) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ProductMapper productMapper = sqlSession
					.getMapper(ProductMapper.class);
			return productMapper.getProductsByStoreAndCategory(storeid,categoryid);
		} finally {
			sqlSession.close();
		}
	}

	public List<Product> getProduct(int storeid, int category_id, int subcategory_id) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ProductMapper productMapper = sqlSession
					.getMapper(ProductMapper.class);
			return productMapper.getProductsByCategoryAndSubcategory(storeid,category_id,subcategory_id);
		} finally {
			sqlSession.close();
		}
	}

	public List<Product> getProduct(String storeIdentity, String category,
			String offset, String rowCount) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ProductMapper productMapper = sqlSession
					.getMapper(ProductMapper.class);
			return productMapper.getProductsByCategory(storeIdentity,category,offset,rowCount);
		} finally {
			sqlSession.close();
		}
	}

	public List<ProductImage> getCommonAndSpecificProductImages(String storeId, String offset, String rowCount) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ProductMapper productMapper = sqlSession
					.getMapper(ProductMapper.class);
			return productMapper.getCommonAndSpecificProductImages(storeId,offset,rowCount);
		} finally {
			sqlSession.close();
		}
	}

	public List<ProductImage> getCommonAndSpecificProductImages(String storeId,
			String offset, String rowcount, String searchString) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory()
				.openSession();
		try {
			ProductMapper productMapper = sqlSession
					.getMapper(ProductMapper.class);
			return productMapper.getCommonAndSpecificProductImagesbySearch(storeId,offset,rowcount,searchString);
		} finally {
			sqlSession.close();
		}
	}

}