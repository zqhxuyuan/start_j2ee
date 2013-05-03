package com.xuyuan.j2ee.jmx.stepbystep.helloworld;

import java.lang.management.ManagementFactory;

import javax.management.MBeanServer;
import javax.management.ObjectName;

import com.sun.jdmk.comm.HtmlAdaptorServer;

/**
 * 连接MBeanServer的方式:HTML:http://localhost:8082
 * 或者使用jconsole的本地连接方式
 */
public class HelloAgent {
	
    public static void main(String[] args) throws Exception {    
        MBeanServer server = ManagementFactory.getPlatformMBeanServer();    
        ObjectName helloName = new ObjectName("chengang:name=HelloWorld");    
        server.registerMBean(new Hello(), helloName);
        
        // HTML页面
        ObjectName adapterName = new ObjectName("HelloAgent:name=htmladapter,port=8082");    
        HtmlAdaptorServer adapter = new HtmlAdaptorServer();    
        server.registerMBean(adapter, adapterName);    
        adapter.start();    
        System.out.println("start.....");
    }
    
}

