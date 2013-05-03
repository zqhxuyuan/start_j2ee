package com.xuyuan.j2ee.jmx.standardbeans._1;

public class ServerImpl {

	/**
	 * @uml.property  name="startTime"
	 */
	public final long startTime; 
	
    public ServerImpl() { 
        startTime = System.currentTimeMillis(); 
    } 
}
