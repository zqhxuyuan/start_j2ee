package com.xuyuan.spring3.recipes.advanceioc;

import java.io.IOException;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xuyuan.spring3.recipes.advanceioc.t1.Product;
import com.xuyuan.spring3.recipes.advanceioc.t4.ProductRanking;
import com.xuyuan.spring3.recipes.advanceioc.t6.ShoppingCart;

public class IocTest {

	/**
	 * @uml.property  name="context"
	 * @uml.associationEnd  
	 */
	ApplicationContext context; 
	
	@Before
	public void setUp() {
		context = new ClassPathXmlApplicationContext("spring/2/beans.xml");
	}
	
	@Test
    public void test01() {
		//Product aaa = ProductCreator.createProduct("aaa"); 
		Product aaa = (Product)context.getBean("aaa");
		System.out.println(aaa);
		
		/**
		  	ProductCreator productCreator = new ProductCreator(); 
			productCreator.setProducts(...); 
			Product aaa = productCreator.createProduct("bbb"); 
		 */
		aaa = (Product)context.getBean("bbb");
		System.out.println(aaa);
		
		//2-4. Declaring Beans from Object Properties
		aaa = (Product)context.getBean("bestSeller");
		aaa = (Product)context.getBean("productRanking.bestSeller");
		aaa = (Product)context.getBean("bestSeller1");
		System.out.println(aaa);
		
		//2-15. Registering Property Editors in Spring
//		com.xuyuan.spring3.recipes.advanceioc.t15.ProductRanking productRanking = (com.xuyuan.spring3.recipes.advanceioc.t15.ProductRanking) context.getBean("productRanking3"); 
//        System.out.println("Product ranking from " + productRanking.getFromDate() + " to " + productRanking.getToDate());
        
        //2-16. Creating Custom Property Editors 
        ProductRanking productRanking = (ProductRanking) context.getBean("productRanking4"); 
        System.out.println(productRanking.getBestSeller());
	}
	
	@Test
	public void test02() throws IOException {
		Product aaa = (Product) context.getBean("a1"); 
        Product cdrw = (Product) context.getBean("a2"); 
        Product dvdrw = (Product) context.getBean("a3"); 
        ShoppingCart cart1 = (ShoppingCart) context.getBean("shoppingCart"); 
        cart1.addItem(aaa); 
        cart1.addItem(cdrw); 
        System.out.println("Shopping cart 1 contains " + cart1.getItems()); 
        
        ShoppingCart cart2 = (ShoppingCart) context.getBean("shoppingCart"); 
        cart2.addItem(dvdrw); 
        System.out.println("Shopping cart 2 contains " + cart2.getItems());
        
        //NullPointerException
        //Cashier cashier1 = (Cashier) context.getBean("cashier1"); 
        //cashier1.checkout(cart1);
        
        //2-7. Customizing Bean Initialization and Destruction
//        Cashier cashier2 = (Cashier) context.getBean("cashier3"); 
//        cashier2.checkout(cart1);
        
        //2-9. Making Beans Aware of the Container
//        com.xuyuan.spring3.recipes.advanceioc.t9.Cashier cashier3 = 
//        	(com.xuyuan.spring3.recipes.advanceioc.t9.Cashier) context.getBean("cashier4"); 
//        cashier3.checkout(cart1);
        
        //2-11. Creating Bean Post Processors
//        com.xuyuan.spring3.recipes.advanceioc.t11.Cashier cashier4 = 
//        	(com.xuyuan.spring3.recipes.advanceioc.t11.Cashier) context.getBean("cashier6"); 
//        cashier4.checkout(cart1);
        
        //2-12. Externalizing Bean Configurations
//        com.xuyuan.spring3.recipes.advanceioc.t11.Cashier cashier5 = 
//        	(com.xuyuan.spring3.recipes.advanceioc.t11.Cashier) context.getBean("cashier7"); 
//        cashier5.checkout(cart1);
        
        //2-14. Communicating with Application Events
//	      com.xuyuan.spring3.recipes.advanceioc.t14.Cashier cashier5 = 
//	    	(com.xuyuan.spring3.recipes.advanceioc.t14.Cashier) context.getBean("cashier8"); 
//	      cashier5.checkout(cart1);
	      
	      
	}
	
	@Test
	public void test03() throws IOException {
		context.getBean("bannerLoader");
		context.getBean("bannerLoader1");
	}
	
	@Test
	public void test04() throws IOException {

	}
	
}
