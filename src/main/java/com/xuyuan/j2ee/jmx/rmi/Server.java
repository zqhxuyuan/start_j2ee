package com.xuyuan.j2ee.jmx.rmi;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Server {
	
	public static void main(String[] args) throws Exception {
		new ClassPathXmlApplicationContext("spring/18/server.xml");
		
		System.out.println("Server started.");
		Object lock = new Object();
		synchronized (lock) {
			lock.wait();
		}
	}
}


