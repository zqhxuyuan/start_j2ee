package com.xuyuan.j2ee.jmx.stepbystep.connect;

import java.lang.management.ManagementFactory;
import java.util.Iterator;
import java.util.Set;

import javax.management.Attribute;
import javax.management.MBeanInfo;
import javax.management.MBeanServer;
import javax.management.MBeanServerConnection;
import javax.management.MBeanServerInvocationHandler;
import javax.management.ObjectInstance;
import javax.management.ObjectName;
import javax.management.remote.JMXConnector;
import javax.management.remote.JMXConnectorFactory;
import javax.management.remote.JMXConnectorServer;
import javax.management.remote.JMXConnectorServerFactory;
import javax.management.remote.JMXServiceURL;

import com.xuyuan.j2ee.jmx.stepbystep.helloworld.Hello;
import com.xuyuan.j2ee.jmx.stepbystep.helloworld.HelloMBean;

/**
 * 1. 在DOS运行命令：rmiregistry 9999
 * 2. 运行Client
 */
public class Client {
	
    public static void main(String[] args) throws Exception {       
    	MBeanServer server = ManagementFactory.getPlatformMBeanServer();    
        ObjectName helloName = new ObjectName("chengang:name=HelloWorld");    
        server.registerMBean(new Hello(), helloName);
        
        JMXServiceURL url = new JMXServiceURL("service:jmx:rmi:///jndi/rmi://localhost:9999/server");
        JMXConnectorServer cs = JMXConnectorServerFactory.newJMXConnectorServer(url, null, server);    
        cs.start();  
        
        JMXConnector jmxc = JMXConnectorFactory.connect(url, null);        
        MBeanServerConnection mbsc = jmxc.getMBeanServerConnection();      
        ObjectName mbeanName = new ObjectName("chengang:name=HelloWorld");
        
        // 把所有Domain都打印出来    
        System.out.println("Domains:---------------");       
        String domains[] = mbsc.getDomains();        
        for (int i = 0; i < domains.length; i++) {        
            System.out.println("\tDomain[" + i + "] = " + domains[i]);     
        }    
        
        // MBean的总数    
        System.out.println("MBean count = " + mbsc.getMBeanCount());    
        
        // 对name属性的操作（属性名的第一个字母要大写）    
        mbsc.setAttribute(mbeanName, new Attribute("Name", "PANDA"));// 设值    
        System.out.println("Name = " + mbsc.getAttribute(mbeanName, "Name"));// 取值    
        
        // 得到proxy代理后直接调用的方式    
        HelloMBean proxy = (HelloMBean) MBeanServerInvocationHandler.newProxyInstance(mbsc, mbeanName, HelloMBean.class, false);         
        proxy.printHello();         
        proxy.printHello("Raymend");    
        
        // 远程调用的方式    
        mbsc.invoke(mbeanName, "printHello", null, null);          
        mbsc.invoke(mbeanName, "printHello", new Object[] { "熊猫烧香" }, new String[] { String.class.getName() });    
        
        // mbean的信息    
        MBeanInfo info = mbsc.getMBeanInfo(mbeanName);          
        System.out.println("Hello Class: " + info.getClassName());       
        System.out.println("Hello Attriber：" + info.getAttributes()[0].getName());      
        System.out.println("Hello Operation：" + info.getOperations()[0].getName());    
        
        // 得到所有的MBean的ObjectName    
        System.out.println("all ObjectName：---------------");         
        Set set = mbsc.queryMBeans(null, null);        
        for (Iterator it = set.iterator(); it.hasNext();) {         
            ObjectInstance oi = (ObjectInstance) it.next();         
            System.out.println("\t" + oi.getObjectName());         
        }    
        // 注销    
        // mbsc.unregisterMBean(mbeanName);    
        // 关闭MBeanServer连接    
        jmxc.close();      
    }    
}
