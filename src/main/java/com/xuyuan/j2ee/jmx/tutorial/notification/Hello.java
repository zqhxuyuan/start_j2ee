/* Hello.java - MBean implementation for the Hello World MBean.
   This class must implement all the Java methods declared in the
   HelloMBean interface, with the appropriate behavior for each one.  */

package com.xuyuan.j2ee.jmx.tutorial.notification;

import javax.management.*;

public class Hello extends NotificationBroadcasterSupport implements HelloMBean {

	public void sayHello() {
		System.out.println("hello, world");
	}

	public int add(int x, int y) {
		return x + y;
	}

	public String getName() {
		return this.name;
	}

	/**
	 * @return
	 * @uml.property  name="cacheSize"
	 */
	public int getCacheSize() {
		return this.cacheSize;
	}

	/**
	 * @param size
	 * @uml.property  name="cacheSize"
	 */
	public synchronized void setCacheSize(int size) {
		int oldSize = this.cacheSize;
		this.cacheSize = size;

		System.out.println("Cache size now " + this.cacheSize);

		/*
		 * Construct a notification that describes the change. The "source" of a
		 * notification is the ObjectName of the MBean that emitted it. But an
		 * MBean can put a reference to itself ("this") in the source, and the
		 * MBean server will replace this with the ObjectName before sending the
		 * notification on to its clients.
		 * 
		 * For good measure, we maintain a sequence number for each notification
		 * emitted by this MBean.
		 * 
		 * The oldValue and newValue parameters to the constructor are of type
		 * Object, so we are relying on Tiger's autoboxing here.
		 */
		Notification n = new AttributeChangeNotification(this,
				sequenceNumber++, System.currentTimeMillis(),
				"CacheSize changed", "CacheSize", "int", oldSize, this.cacheSize);

		/*
		 * Now send the notification using the sendNotification method inherited
		 * from the parent class NotificationBroadcasterSupport.
		 */
		sendNotification(n);
	}

	@Override
	public MBeanNotificationInfo[] getNotificationInfo() {
		String[] types = new String[] { AttributeChangeNotification.ATTRIBUTE_CHANGE };
		String name = AttributeChangeNotification.class.getName();
		String description = "An attribute of this MBean has changed";
		MBeanNotificationInfo info = new MBeanNotificationInfo(types, name, description);
		return new MBeanNotificationInfo[] { info };
	}

	/**
	 * @uml.property  name="name"
	 */
	private final String name = "Reginald";
	/**
	 * @uml.property  name="cacheSize"
	 */
	private int cacheSize = DEFAULT_CACHE_SIZE;
	private static final int DEFAULT_CACHE_SIZE = 200;

	/**
	 * @uml.property  name="sequenceNumber"
	 */
	private long sequenceNumber = 1;
}
