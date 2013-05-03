package com.xuyuan.j2ee.jmx.stepbystep.notification;

import javax.management.MBeanServer;
import javax.management.MBeanServerFactory;
import javax.management.ObjectName;

import com.sun.jdmk.comm.HtmlAdaptorServer;
import com.xuyuan.j2ee.jmx.stepbystep.helloworld.Hello;

public class HelloAgent {
	
	public static void main(String args[]) throws Exception {
		MBeanServer server = MBeanServerFactory.createMBeanServer();
		ObjectName helloName = new ObjectName("chengang:name=HelloWorld");
		Hello hello = new Hello();
		server.registerMBean(hello, helloName);
		
		ObjectName adapterName = new ObjectName("HelloAgent:name=htmladapter,port=8082");
		HtmlAdaptorServer adapter = new HtmlAdaptorServer();
		server.registerMBean(adapter, adapterName);
		
		Jack jack = new Jack();
		server.registerMBean(jack, new ObjectName("HelloAgent:name=jack"));
		jack.addNotificationListener(new HelloListener(), null, hello);
		
		adapter.start();
		System.out.println("start.....");
	}
	
}
