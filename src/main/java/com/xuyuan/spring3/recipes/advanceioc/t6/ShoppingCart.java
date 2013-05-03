package com.xuyuan.spring3.recipes.advanceioc.t6;

import java.util.ArrayList;
import java.util.List;

import com.xuyuan.spring3.recipes.advanceioc.t1.Product;

public class ShoppingCart {

    /**
	 * @uml.property  name="items"
	 * @uml.associationEnd  multiplicity="(0 -1)" elementType="com.xuyuan.spring3.recipes.advanceioc.t1.Product"
	 */
    private List<Product> items = new ArrayList<Product>();

    public void addItem(Product item) {
        items.add(item);
    }

    public List<Product> getItems() {
        return items;
    }
}
