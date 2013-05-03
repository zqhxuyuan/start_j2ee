/* Main.java - main class for Hello World example.  Create the
   HelloWorld MBean, register it, then wait forever (or until the
   program is interrupted).  */

package com.xuyuan.j2ee.jmx.tutorial.essential;

import java.lang.management.ManagementFactory;

import javax.management.MBeanServer;
import javax.management.ObjectName;

import com.sun.jdmk.comm.HtmlAdaptorServer;

public class Main {
    /* For simplicity, we declare "throws Exception".  Real programs
       will usually want finer-grained exception handling.  */
    public static void main(String[] args) throws Exception {
		// Get the Platform MBean Server
		MBeanServer mbs = ManagementFactory.getPlatformMBeanServer();
	
		// Construct the ObjectName for the MBean we will register
		ObjectName name = new ObjectName("com.example.mbeans:type=Hello");
	
		// Create the Hello World MBean
		Hello mbean = new Hello();
	
		// Register the Hello World MBean
		mbs.registerMBean(mbean, name);
	
		ObjectName adapterName = new ObjectName( "HelloAgent:name=htmladapter,port=8082");    
		HtmlAdaptorServer adapter = new HtmlAdaptorServer();    
		mbs.registerMBean(adapter, adapterName);    
		adapter.start();    
		System.out.println("start....."); 

				
		// Wait forever
		System.out.println("Waiting forever...");
		Thread.sleep(Long.MAX_VALUE);
    }
}
