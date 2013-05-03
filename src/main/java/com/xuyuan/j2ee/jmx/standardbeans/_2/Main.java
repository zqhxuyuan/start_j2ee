package com.xuyuan.j2ee.jmx.standardbeans._2;
import java.lang.management.ManagementFactory;

import javax.management.MBeanServer;
import javax.management.ObjectName;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * http://blog.csdn.net/shirdrn/article/details/6348073
 */
public class Main {

	@Test
	public void testWithJMXAPI() throws Exception {
		MyObjectMBean myObjectMBean = new MyObject(299999007, "shirdrn");
		
		MBeanServer mBeanServer = ManagementFactory.getPlatformMBeanServer();
		ObjectName objectName = new ObjectName("mydomain:mykey=MyObjectMBean");
		mBeanServer.registerMBean(myObjectMBean, objectName);
		
		Object lock = new Object();
		synchronized (lock) {
			lock.wait();
		}
	}
	
	@Test
	public void testWithSpring() throws InterruptedException{
		new ClassPathXmlApplicationContext("spring/18/jmx-1.xml");
		
		Object lock = new Object();
		synchronized (lock) {
			lock.wait();
		}
	}
}


