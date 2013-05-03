package com.xuyuan.spring3.recipes.advanceioc.t2;

import java.util.Map;

import com.xuyuan.spring3.recipes.advanceioc.t1.Product;

public class ProductCreator {

    /**
	 * @uml.property  name="products"
	 * @uml.associationEnd  qualifier="productId:java.lang.String com.xuyuan.spring3.recipes.advanceioc.t1.Product"
	 */
    private Map<String, Product> products;

    public void setProducts(Map<String, Product> products) {
        this.products = products;
    }

    public Product createProduct(String productId) {
        Product product = products.get(productId);
        if (product != null) {
            return product;
        }
        throw new IllegalArgumentException("Unknown product");
    }
}
