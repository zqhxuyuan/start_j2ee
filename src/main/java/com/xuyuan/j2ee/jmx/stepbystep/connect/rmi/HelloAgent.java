package com.xuyuan.j2ee.jmx.stepbystep.connect.rmi;

import java.lang.management.ManagementFactory;

import javax.management.MBeanServer;
import javax.management.ObjectName;
import javax.management.remote.JMXConnectorServer;
import javax.management.remote.JMXConnectorServerFactory;
import javax.management.remote.JMXServiceURL;

import com.sun.jdmk.comm.HtmlAdaptorServer;
import com.xuyuan.j2ee.jmx.stepbystep.helloworld.Hello;

/**
 * 1. 在DOS运行命令：rmiregistry 9999
 * 2. 运行HelloAgent（第一步必须先执行，否则HelloAgent启动不起来）
 * 3. 新开一个DOS运行命令jconsole
 * 4. 选择远程进程，输入service:jmx:rmi:///jndi/rmi://localhost:9999/server
 */
public class HelloAgent {
	
    public static void main(String[] args) throws Exception {    
        MBeanServer server = ManagementFactory.getPlatformMBeanServer();    
        ObjectName helloName = new ObjectName("chengang:name=HelloWorld");    
        server.registerMBean(new Hello(), helloName);
        
        // HTML
        ObjectName adapterName = new ObjectName("HelloAgent:name=htmladapter,port=8082");    
        HtmlAdaptorServer adapter = new HtmlAdaptorServer();    
        server.registerMBean(adapter, adapterName);    
        adapter.start();    
        System.out.println("start.....");
        
        // JConsole
        // Create an RMI connector and start it    
        JMXServiceURL url = new JMXServiceURL("service:jmx:rmi:///jndi/rmi://localhost:9999/server");    
        JMXConnectorServer cs = JMXConnectorServerFactory.newJMXConnectorServer(url, null, server);    
        cs.start();    
        System.out.println("rmi　start....."); 
    }
    
}

