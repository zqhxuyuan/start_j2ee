package com.xuyuan.j2ee.jmx.standardbeans._1;
import java.lang.management.ManagementFactory;

import javax.management.AttributeNotFoundException;
import javax.management.InstanceAlreadyExistsException;
import javax.management.InstanceNotFoundException;
import javax.management.MBeanException;
import javax.management.MBeanServer;
import javax.management.MalformedObjectNameException;
import javax.management.NotCompliantMBeanException;
import javax.management.ObjectName;
import javax.management.ReflectionException;
import javax.swing.JDialog;

import com.sun.jdmk.comm.HtmlAdaptorServer;

public class Main {
	public static void main(String[] args)
			throws InstanceAlreadyExistsException, NotCompliantMBeanException, MalformedObjectNameException,
			NullPointerException, AttributeNotFoundException, InstanceNotFoundException, MBeanException, ReflectionException {
		ServerImpl serverImpl = new ServerImpl();
		ControllerMBean controller = new Controller(serverImpl); //创建MBean

		MBeanServer mbs = ManagementFactory.getPlatformMBeanServer();//获得MBeanServer实例,可在jconsole中使用
		ObjectName objectName = new ObjectName("MyappMBean:name=controller");
		mbs.registerMBean(controller, objectName); 
		
		Long upTime = (Long) mbs.getAttribute(objectName,"upTime"); 
        System.out.println(upTime);
        
		//创建适配器，用于能够通过浏览器访问MBean
		HtmlAdaptorServer adapter = new HtmlAdaptorServer();
		adapter.setPort(9797);
		mbs.registerMBean(adapter, new ObjectName("MyappMBean:name=htmladapter,port=9797"));
		adapter.start();
		
	}
}


