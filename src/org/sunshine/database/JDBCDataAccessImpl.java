package org.sunshine.database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.sunshine.domain.Product;

public class JDBCDataAccessImpl {

	@SuppressWarnings("unused")
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}

    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());


    public List<Product> getProductList() {
        logger.info("Getting products!");
		List<Product> products = jdbcTemplateObject.query(
				"select id, name, description, price from products",
				new ProductMapper());
		return products;
    }

    public void saveProduct(Product prod) {
        logger.info("Saving product: " + prod.getDescription());
        int count = jdbcTemplateObject.update(
            "update products set description = ?, price = ? where id = ?",
             prod.getDescription(), prod.getPrice(), prod.getId());
        logger.info("Rows affected: " + count);
    }
    
    private static class ProductMapper implements ParameterizedRowMapper<Product> {

        public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
            Product prod = new Product();
            prod.setId(rs.getInt("id"));
            prod.setName(rs.getString("name"));
            prod.setDescription(rs.getString("description"));
            prod.setPrice(new Double(rs.getDouble("price")));
            prod.setStoreid(rs.getInt("storeid"));
            prod.setStock(rs.getInt("stock"));
            prod.setImg(rs.getString("img"));
            return prod;
        }

    }
    
	public List<Product> getSelectedProductList(String store) {
		logger.info("Getting products!");
		List<Product> products = jdbcTemplateObject.query(
				"select id,name, description, price, storeid, stock from products where storeid="+store,
				new ProductMapper());
		return products;
	}

}