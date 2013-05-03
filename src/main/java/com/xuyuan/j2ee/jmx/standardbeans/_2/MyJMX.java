package com.xuyuan.j2ee.jmx.standardbeans._2;

import java.io.IOException;
import java.lang.management.ManagementFactory;

import javax.management.InstanceAlreadyExistsException;
import javax.management.MBeanRegistrationException;
import javax.management.MBeanServer;
import javax.management.MalformedObjectNameException;
import javax.management.NotCompliantMBeanException;
import javax.management.ObjectName;

/**
* 测试方法：
* 1.运行测试类
* 2.打开CMD，输入jconsole
* 3.选择本地进程，com.xuyuan.j2ee.jmx.MyJMX，连接
* 4.在MBean选择mydomain，点击MyObjectBean下的属性或操作。
*   操作> show > 操作调用：show() 会弹出对话框
*   属性> name ，修改值，再重复上面的操作，可以看到弹出的对话框的内容改变了。
*/
public class MyJMX {

	private static MBeanServer mBeanServer = null;
	static {
		if(mBeanServer==null) {
			mBeanServer = ManagementFactory.getPlatformMBeanServer();
		}
	}

	public void register(Object objectMBean, ObjectName objectName)
			throws InstanceAlreadyExistsException, MBeanRegistrationException,
			NotCompliantMBeanException {
		mBeanServer.registerMBean(objectMBean, objectName);
	}

	public static void main(String[] args) throws InterruptedException,
			InstanceAlreadyExistsException, MBeanRegistrationException,
			NotCompliantMBeanException, MalformedObjectNameException,
			NullPointerException, IOException {
		MyJMX jmx = new MyJMX();
		String objectNameString = "mydomain:mykey=MyObjectMBean";
		ObjectName objectName = new ObjectName(objectNameString);
		MyObjectMBean myObjectMBean = new MyObject(299999007, "shirdrn");
		jmx.register(myObjectMBean, objectName);

//		String serviceURL = "service:jmx:rmi:///jndi/rmi://localhost:1099/jmxrmi";  
//        JMXServiceURL url = new JMXServiceURL(serviceURL);  
//        JMXConnectorServer connectorServer = JMXConnectorServerFactory.newJMXConnectorServer(url, null, mBeanServer);  
        
		Object lock = new Object();
		synchronized (lock) {
			lock.wait();
		}
	}
}
