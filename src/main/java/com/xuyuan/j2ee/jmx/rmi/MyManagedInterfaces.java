package com.xuyuan.j2ee.jmx.rmi;

/**
 * @author  Administrator
 */
public interface MyManagedInterfaces {
	public long setId(long id);
	/**
	 * @uml.property  name="name"
	 */
	public String getName();
	public String show();
}