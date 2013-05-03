package com.xuyuan.j2ee.jmx.rmi;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class Proxy {
	
	public static void main(String[] args) throws Exception {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("spring/18/proxy.xml");
		System.out.println("Proxy server started.");
		MyManagedInterfaces proxy = (MyManagedInterfaces) ctx.getBean("proxy");
		String message = proxy.show();
		System.out.println("proxy.show() = " + message);
		
		Object lock = new Object();
		synchronized (lock) {
			lock.wait();
		}
	}
}
