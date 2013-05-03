package com.xuyuan.j2ee.rmi;

import java.io.Serializable;

public class User implements Serializable {
	private static final long serialVersionUID = -5181326376273015609L;
	/**
	 * @uml.property  name="id"
	 */
	private String id;
	/**
	 * @uml.property  name="name"
	 */
	private String name;

	public User(){
	}
	
	/**
	 * @return
	 * @uml.property  name="id"
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id
	 * @uml.property  name="id"
	 */
	public void setId(String id) {
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

	@Override
	public String toString() {
		return "UserDTO [id=" + id + ", name=" + name + "]";
	}
	
}

