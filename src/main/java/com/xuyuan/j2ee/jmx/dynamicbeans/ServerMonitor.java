package com.xuyuan.j2ee.jmx.dynamicbeans;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;

import javax.management.Attribute;
import javax.management.AttributeList;
import javax.management.AttributeNotFoundException;
import javax.management.DynamicMBean;
import javax.management.InvalidAttributeValueException;
import javax.management.MBeanAttributeInfo;
import javax.management.MBeanConstructorInfo;
import javax.management.MBeanException;
import javax.management.MBeanInfo;
import javax.management.ReflectionException;

import com.xuyuan.j2ee.jmx.standardbeans._1.ServerImpl;

public class ServerMonitor implements DynamicMBean {

	/**
	 * @uml.property  name="target"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
	private final ServerImpl target;
	/**
	 * @uml.property  name="mBeanInfo"
	 * @uml.associationEnd  
	 */
	private MBeanInfo mBeanInfo;

	public ServerMonitor(ServerImpl target) {
		this.target = target;
	}

	// 实现获取被管理的 ServerImpl 的 upTime
	public long upTime() {
		return System.currentTimeMillis() - target.startTime;
	}

	// javax.management.MBeanServer 会通过查询 getAttribute("Uptime") 获得 "Uptime" 属性值
	public Object getAttribute(String attribute) throws AttributeNotFoundException, MBeanException, ReflectionException {
		if (attribute.equals("UpTime")) {
			return upTime();
		}
		return null;
	}

	// 给出 ServerMonitor 的元信息。
	public MBeanInfo getMBeanInfo() {
		if (mBeanInfo == null) {
			try {
				Class cls = this.getClass();
				// 用反射获得 "upTime" 属性的读方法
				Method readMethod = cls.getMethod("upTime", new Class[0]);
				// 用反射获得构造方法
				Constructor constructor = cls.getConstructor(new Class[] { ServerImpl.class });
				// 关于 "upTime" 属性的元信息 : 名称为 UpTime，只读属性 ( 没有写方法 )。
				MBeanAttributeInfo upTimeMBeanAttributeInfo = new MBeanAttributeInfo("UpTime", "The time span since server start", readMethod, null);
				// 关于构造函数的元信息
				MBeanConstructorInfo mBeanConstructorInfo = new MBeanConstructorInfo("Constructor for ServerMonitor", constructor);
				// ServerMonitor 的元信息，为了简单起见，在这个例子里，
				// 没有提供 invocation 以及 listener 方面的元信息
				mBeanInfo = new MBeanInfo(cls.getName(), "Monitor that controls the server",
						new MBeanAttributeInfo[] { upTimeMBeanAttributeInfo },
						new MBeanConstructorInfo[] { mBeanConstructorInfo },
						null, null);
			} catch (Exception e) {
				throw new Error(e);
			}

		}
		return mBeanInfo;
	}

	public AttributeList getAttributes(String[] arg0) {
		return null;
	}

	public Object invoke(String arg0, Object[] arg1, String[] arg2)
			throws MBeanException, ReflectionException {
		return null;
	}

	public void setAttribute(Attribute arg0) throws AttributeNotFoundException,
			InvalidAttributeValueException, MBeanException, ReflectionException {
		return;
	}

	public AttributeList setAttributes(AttributeList arg0) {
		return null;
	}
}
