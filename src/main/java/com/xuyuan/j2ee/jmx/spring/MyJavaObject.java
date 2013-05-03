package com.xuyuan.j2ee.jmx.spring;

import org.apache.log4j.Logger;

public class MyJavaObject {

	private static final Logger LOG = Logger.getLogger(MyJavaObject.class);
	/**
	 * @uml.property  name="id"
	 */
	private long id;
	/**
	 * @uml.property  name="name"
	 */
	private String name;

	public MyJavaObject() {
		super();
	}

	public MyJavaObject(long id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	/**
	 * @return
	 * @uml.property  name="id"
	 */
	public long getId() {
		return id;
	}

	/**
	 * @param id
	 * @uml.property  name="id"
	 */
	public void setId(long id) {
		this.id = id;
	}

	/**
	 * @return
	 * @uml.property  name="name"
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 * @uml.property  name="name"
	 */
	public void setName(String name) {
		this.name = name;
	}

	public String show() {
		StringBuffer sb = new StringBuffer().append("id=").append(id).append(", name=").append(name);
		LOG.info("show()=" + sb.toString());
		return sb.toString();
	}
}
