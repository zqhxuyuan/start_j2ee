package com.xuyuan.spring3.recipes.enterprise.jmx;
import java.lang.management.ManagementFactory;

import javax.management.Descriptor;
import javax.management.MBeanServer;
import javax.management.ObjectName;
import javax.management.modelmbean.DescriptorSupport;
import javax.management.modelmbean.ModelMBeanAttributeInfo;
import javax.management.modelmbean.ModelMBeanInfo;
import javax.management.modelmbean.ModelMBeanInfoSupport;
import javax.management.modelmbean.ModelMBeanOperationInfo;
import javax.management.modelmbean.RequiredModelMBean;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xuyuan.spring3.recipes.enterprise.FileReplicator;

public class Main {
	
	public static void main(String[] args) throws Exception {
		//Spring集成JMX，由Spring管理JMX（包括创建MBeanServer,注册MBean等）
		//new ClassPathXmlApplicationContext("spring/18/jmx_spring.xml");
		new ClassPathXmlApplicationContext("spring/18/jmx_annotation.xml");
		
		//JMX API方式
		/**
		ApplicationContext context = new ClassPathXmlApplicationContext("spring/18/jmx.xml"); 
        FileReplicator documentReplicator = (FileReplicator) context.getBean("documentReplicator"); 
        MBeanServer mbeanServer = ManagementFactory.getPlatformMBeanServer(); 
        ObjectName objectName = new ObjectName("bean:name=documentReplicator"); 
 
        RequiredModelMBean mbean = new RequiredModelMBean(); 
        mbean.setManagedResource(documentReplicator, "objectReference"); 
        
        Descriptor srcDirDescriptor = new DescriptorSupport(new String[] {"name=SrcDir", "descriptorType=attribute", "getMethod=getSrcDir", "setMethod=setSrcDir" }); 
        ModelMBeanAttributeInfo srcDirInfo = new ModelMBeanAttributeInfo("SrcDir", "java.lang.String", "Source directory", true, true, false, srcDirDescriptor); 
        Descriptor destDirDescriptor = new DescriptorSupport(new String[] {"name=DestDir", "descriptorType=attribute", "getMethod=getDestDir", "setMethod=setDestDir" });
        ModelMBeanAttributeInfo destDirInfo = new ModelMBeanAttributeInfo("DestDir", "java.lang.String", "Destination directory", true, true, false, destDirDescriptor); 
 
        ModelMBeanOperationInfo getSrcDirInfo = new ModelMBeanOperationInfo("Get source directory", FileReplicator.class.getMethod("getSrcDir")); 
        ModelMBeanOperationInfo setSrcDirInfo = new ModelMBeanOperationInfo("Set source directory", FileReplicator.class.getMethod("setSrcDir", String.class)); 
        ModelMBeanOperationInfo getDestDirInfo = new ModelMBeanOperationInfo("Get destination directory", FileReplicator.class.getMethod("getDestDir")); 
        ModelMBeanOperationInfo setDestDirInfo = new ModelMBeanOperationInfo("Set destination directory", FileReplicator.class.getMethod("setDestDir", String.class)); 
        ModelMBeanOperationInfo replicateInfo = new ModelMBeanOperationInfo("Replicate files", FileReplicator.class.getMethod("replicate")); 
 
       	ModelMBeanInfo mbeanInfo = new ModelMBeanInfoSupport("FileReplicator", "File replicator", 
       			new ModelMBeanAttributeInfo[] { srcDirInfo, destDirInfo }, null, 
       			new ModelMBeanOperationInfo[] { getSrcDirInfo, setSrcDirInfo, getDestDirInfo, setDestDirInfo, replicateInfo }, null); 
        mbean.setModelMBeanInfo(mbeanInfo); 
        mbeanServer.registerMBean(mbean, objectName); 
        */
		
        Object lock = new Object();
		synchronized (lock) {
			lock.wait();
		}
    } 
}


