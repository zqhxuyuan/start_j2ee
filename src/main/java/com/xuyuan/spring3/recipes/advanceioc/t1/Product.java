package com.xuyuan.spring3.recipes.advanceioc.t1;

public abstract class Product {

    public static final Product AAA = new Battery("AAA", 2.5);
    public static final Product CDRW = new Disc("CD-RW", 1.5);

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
	 * @return
	 * @uml.property  name="price"
	 */
    public double getPrice() {
        return price;
    }

    /**
	 * @param name
	 * @uml.property  name="name"
	 */
    public void setName(String name) {
        this.name = name;
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
