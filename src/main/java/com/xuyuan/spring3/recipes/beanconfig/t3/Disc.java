package com.xuyuan.spring3.recipes.beanconfig.t3;

public class Disc extends Product{

	/**
	 * @uml.property  name="capacity"
	 */
	private int capacity; 
	
    public Disc() { 
        super(); 
    } 
    
    public Disc(String name, double price) { 
        super(name, price); 
    }
	
    /**
	 * @return
	 * @uml.property  name="capacity"
	 */
    public int getCapacity() {
		return capacity;
	}
	
    /**
	 * @param capacity
	 * @uml.property  name="capacity"
	 */
    public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
}
