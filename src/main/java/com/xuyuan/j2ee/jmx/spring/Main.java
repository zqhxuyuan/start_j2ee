package com.xuyuan.j2ee.jmx.spring;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {
	
	public static void main(String[] args) throws Exception {
		//Spring集成JMX，由Spring管理JMX（包括创建MBeanServer,注册MBean等）
		new ClassPathXmlApplicationContext("spring/18/jmx-3.xml");
        Object lock = new Object();
		synchronized (lock) {
			lock.wait();
		}
    } 
}


