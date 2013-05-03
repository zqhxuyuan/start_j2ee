package com.xuyuan.j2ee.jmx.spring;

import org.apache.log4j.Logger;
import org.springframework.jmx.export.annotation.ManagedAttribute;
import org.springframework.jmx.export.annotation.ManagedOperation;
import org.springframework.jmx.export.annotation.ManagedResource;

@ManagedResource(objectName = "annojmx:myjao=AnnotationObject", description = "MyJavaAnnotationObject")
public class MyJavaAnnotationObject {
	
	private static final Logger LOG = Logger.getLogger(MyJavaAnnotationObject.class);
	/**
	 * @uml.property  name="id"
	 */
	private long id;
	/**
	 * @uml.property  name="name"
	 */
	private String name;

	public MyJavaAnnotationObject() {
		super();
	}

	public MyJavaAnnotationObject(long id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	/**
	 * @return
	 * @uml.property  name="id"
	 */
	@ManagedAttribute
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
	@ManagedAttribute
	public void setName(String name) {
		this.name = name;
	}

	@ManagedOperation
	public String show() {
		StringBuffer sb = new StringBuffer().append("id=").append(id).append(
				", name=").append(name);
		LOG.info("show()=" + sb.toString());
		return sb.toString();
	}
}
