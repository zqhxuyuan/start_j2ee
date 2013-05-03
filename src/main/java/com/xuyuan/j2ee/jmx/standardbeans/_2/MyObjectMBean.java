package com.xuyuan.j2ee.jmx.standardbeans._2;

/**
 * @author  Administrator
 */
public interface MyObjectMBean {  
    public long getId();  
    /**
	 * @uml.property  name="name"
	 */
    public String getName();  
    /**
	 * @param name
	 * @uml.property  name="name"
	 */
    public void setName(String name);  
    public String show();  
} 
