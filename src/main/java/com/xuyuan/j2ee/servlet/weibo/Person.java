package com.xuyuan.j2ee.servlet.weibo;

public class Person {
	/**
	 * @uml.property  name="id"
	 */
	private long id;
	/**
	 * @uml.property  name="name"
	 */
	private String name;
	/**
	 * @uml.property  name="age"
	 */
	private int age;
	/**
	 * @uml.property  name="hoppy"
	 */
	private String hoppy;


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

	/**
	 * @return
	 * @uml.property  name="age"
	 */
	public int getAge() {
		return age;
	}

	/**
	 * @param age
	 * @uml.property  name="age"
	 */
	public void setAge(int age) {
		this.age = age;
	}

	/**
	 * @return
	 * @uml.property  name="hoppy"
	 */
	public String getHoppy() {
		return hoppy;
	}

	/**
	 * @param hoppy
	 * @uml.property  name="hoppy"
	 */
	public void setHoppy(String hoppy) {
		this.hoppy = hoppy;
	}

}
