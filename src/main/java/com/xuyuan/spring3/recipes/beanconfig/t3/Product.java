package com.xuyuan.spring3.recipes.beanconfig.t3;

/**
 * 1-3. Creating Beans by Invoking a Constructor
 * develop a shop application to sell products online
 * 
 * there are many types of products in your shop, 
 * you make the  Product class abstract for different product subclasses to extend.
 */
public abstract class Product { 
	 
    /**
	 * @uml.property  name="name"
	 */
    private String name; 
    /**
	 * @uml.property  name="price"
	 */
    private double price; 
 
    public Product() {} 
 
    public Product(String name, double price) { 
        this.name = name; 
        this.price = price; 
    } 
 
    /**
	 * @return
	 * @uml.property  name="name"
	 */
    public String getName() {
		return name;
	}

	/**
	 * @param name
	 * @uml.property  name="name"
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return
	 * @uml.property  name="price"
	 */
	public double getPrice() {
		return price;
	}

	/**
	 * @param price
	 * @uml.property  name="price"
	 */
	public void setPrice(double price) {
		this.price = price;
	}

	public String toString() { 
        return name + " " + price; 
    } 
}
