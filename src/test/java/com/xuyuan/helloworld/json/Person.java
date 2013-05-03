package com.xuyuan.helloworld.json;

public class Person {
	
	/**
	 * @uml.property  name="name"
	 */
	private String name;
	/**
	 * @uml.property  name="pass"
	 */
	private String pass;
	
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
	 * @uml.property  name="pass"
	 */
	public String getPass() {
		return pass;
	}

	/**
	 * @param pass
	 * @uml.property  name="pass"
	 */
	public void setPass(String pass) {
		this.pass = pass;
	}
	
}
