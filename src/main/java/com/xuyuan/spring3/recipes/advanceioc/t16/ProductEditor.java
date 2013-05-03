package com.xuyuan.spring3.recipes.advanceioc.t16;

import java.beans.PropertyEditorSupport;

import com.xuyuan.spring3.recipes.advanceioc.t1.Product;

/**
 * 2-16. Creating Custom Property Editors
 * write a property editor for the  Product class. You can design the string representation of a product as three parts, 
 * which are the concrete class name, the product name, and the price. Each part is separated by a comma. 
 * Then, you can write the following ProductEditor class for converting them:
 * 
 */
public class ProductEditor extends PropertyEditorSupport {

    public String getAsText() {
        Product product = (Product) getValue();
        return product.getClass().getName() + "," + product.getName() + "," + product.getPrice();
    }

    public void setAsText(String text) throws IllegalArgumentException {
        String[] parts = text.split(",");
        try {
            Product product = (Product) Class.forName(parts[0]).newInstance();
            product.setName(parts[1]);
            product.setPrice(Double.parseDouble(parts[2]));
            setValue(product);
        } catch (Exception e) {
            throw new IllegalArgumentException(e);
        }
    }
}
