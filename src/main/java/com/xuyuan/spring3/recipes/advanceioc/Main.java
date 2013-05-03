package com.xuyuan.spring3.recipes.advanceioc;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xuyuan.spring3.recipes.advanceioc.t1.Product;
import com.xuyuan.spring3.recipes.advanceioc.t15.ProductRanking;
import com.xuyuan.spring3.recipes.advanceioc.t6.ShoppingCart;
import com.xuyuan.spring3.recipes.advanceioc.t9.Cashier;

public class Main {

    public static void main(String[] args) throws Exception {
        ApplicationContext context = 
            new ClassPathXmlApplicationContext("spring/beans02_advanceioc.xml");

        Product aaa = (Product) context.getBean("aaa");
        Product cdrw = (Product) context.getBean("cdrw");
        Product dvdrw = (Product) context.getBean("dvdrw");

        // scope=prototype
        ShoppingCart cart1 = (ShoppingCart) context.getBean("shoppingCart");
        cart1.addItem(aaa);
        cart1.addItem(cdrw);
        System.out.println("Shopping cart 1 contains " + cart1.getItems());

        ShoppingCart cart2 = (ShoppingCart) context.getBean("shoppingCart");
        cart2.addItem(dvdrw);
        System.out.println("Shopping cart 2 contains " + cart2.getItems());
        
        Cashier cashier1 = (Cashier)context.getBean("cashier1");
        cashier1.checkout(cart1);

        // register and creating custom property editors
        ProductRanking productRanking = (ProductRanking) context.getBean("productRanking");
        System.out.println("Product ranking from " + productRanking.getFromDate() + " to " +productRanking.getToDate());
    }
}
