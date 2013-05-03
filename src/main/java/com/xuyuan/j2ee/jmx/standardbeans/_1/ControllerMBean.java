package com.xuyuan.j2ee.jmx.standardbeans._1;

//http://maimode.iteye.com/blog/1354377
/**
 * @author  Administrator
 */
public interface ControllerMBean {
	//属性
	/**
	 * @param name
	 * @uml.property  name="name"
	 */
	public void setName(String name);
	/**
	 * @uml.property  name="name"
	 */
	public String getName();
	public long getUpTime();
	
	//操作
	// 获取当前信息
	public String status();
	public void start();
	public void stop();
}
