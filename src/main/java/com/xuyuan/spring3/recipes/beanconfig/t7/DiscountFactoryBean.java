package com.xuyuan.spring3.recipes.beanconfig.t7;

import org.springframework.beans.factory.config.AbstractFactoryBean;

import com.xuyuan.spring3.recipes.beanconfig.t3.Product;

/**
 * Factory beans
 * JndiObjectFactoryBean: looking up an object (eg.data source) from JNDI  
 * ProxyFactoryBean: using classic Spring AOP to create a proxy for a bean
 * LocalSessionFactoryBean: creating a Hibernate session factory in the IoC container
 * 
 * write a factory bean for creating a product with a discount applied  to the price. 
 * Each time you request a bean that implements the  FactoryBean interface, 
 * the Spring IoC container will use this factory bean to create the target bean and return it to you.
 */
public class DiscountFactoryBean extends AbstractFactoryBean{

	/**
	 * @uml.property  name="product"
	 * @uml.associationEnd  
	 */
	private Product product; 
    /**
	 * @uml.property  name="discount"
	 */
    private double discount; 
 
    /**
	 * @param product
	 * @uml.property  name="product"
	 */
    public void setProduct(Product product) { 
        this.product = product; 
    }
    
    /**
	 * @param discount
	 * @uml.property  name="discount"
	 */
    public void setDiscount(double discount) { 
        this.discount = discount; 
    } 
 
    @Override
    public Class getObjectType() { 
        return product.getClass(); 
    } 
 
    @Override
    protected Object createInstance() throws Exception { 
        product.setPrice(product.getPrice() * (1 - discount)); 
        return product; 
    } 
}
