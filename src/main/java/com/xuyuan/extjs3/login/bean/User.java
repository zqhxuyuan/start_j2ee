package com.xuyuan.extjs3.login.bean;

import java.io.Serializable;

public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * @uml.property  name="id"
	 */
	private String id;
	/**
	 * @uml.property  name="username"
	 */
	private String username;
	/**
	 * @uml.property  name="password"
	 */
	private String password;
	/**
	 * @uml.property  name="description"
	 */
	private String description;

	public User() {

	}

	public User(String id, String username, String password, String description) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.description = description;
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
	 * @uml.property  name="username"
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username
	 * @uml.property  name="username"
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return
	 * @uml.property  name="password"
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password
	 * @uml.property  name="password"
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return
	 * @uml.property  name="description"
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description
	 * @uml.property  name="description"
	 */
	public void setDescription(String description) {
		this.description = description;
	}
}
