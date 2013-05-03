package com.xuyuan.j2ee.jmx.stepbystep.modelbean;

public class Hello{    
    /**
	 * @uml.property  name="name"
	 */
    private String name;    
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
    public void printHello() {    
        System.out.println("Hello World, " + name);    
    }    
    public void printHello(String whoName) {    
        System.out.println("Hello , " + whoName);    
    }    
} 

