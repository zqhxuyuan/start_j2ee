package com.xuyuan.spring3.recipes.advanceioc.t1;

/**
 * 2-1. Creating Beans by Invoking a Static Factory Method
 * @author Administrator
 *
 */
public class ProductCreator {

	public static Product createProduct(String productId) { 
        if ("aaa".equals(productId)) { 
            return new Battery("AAA", 2.5); 
        } else if ("cdrw".equals(productId)) { 
            return new Disc("CD-RW", 1.5); 
        } 
        throw new IllegalArgumentException("Unknown product"); 
    }
    
}
