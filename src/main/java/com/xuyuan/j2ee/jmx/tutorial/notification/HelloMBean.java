/* HelloMBean.java - MBean interface describing the management
   operations and attributes for the Hello World MBean.  In this case
   there are two operations, "sayHello" and "add", and two attributes,
   "Name" and "CacheSize". */

package com.xuyuan.j2ee.jmx.tutorial.notification;

/**
 * @author  Administrator
 */
public interface HelloMBean {
    // operations

    public void sayHello();
    public int add(int x, int y);

    // attributes

    // a read-only attribute called Name of type String
    /**
	 * @uml.property  name="name"
	 */
    public String getName();

    // a read-write attribute called CacheSize of type int
    public int getCacheSize();
    public void setCacheSize(int size);
}
