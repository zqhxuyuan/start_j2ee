package com.xuyuan.j2ee.jmx.stepbystep.helloworld;

/**
 * @author  Administrator
 */
public interface HelloMBean {    
    /**
	 * @uml.property  name="name"
	 */
    public String getName();    
    /**
	 * @param name
	 * @uml.property  name="name"
	 */
    public void setName(String name);    
    public void printHello();    
    public void printHello(String whoName);    
} 

