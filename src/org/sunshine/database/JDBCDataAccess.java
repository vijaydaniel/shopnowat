package org.sunshine.database;

import java.util.List;

import org.sunshine.domain.Product;

public interface JDBCDataAccess {

    public List<Product> getProductList();
    public List<Product> getSelectedProductList(String store);
    public void saveProduct(Product prod);

}