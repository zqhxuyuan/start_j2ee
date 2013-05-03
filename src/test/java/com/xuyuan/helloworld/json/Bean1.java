package com.xuyuan.helloworld.json;

public class Bean1 {
	/**
	 * @uml.property  name="name"
	 */
	private String name;
	/**
	 * @uml.property  name="pojoId"
	 */
	private int pojoId;
	/**
	 * @uml.property  name="options" multiplicity="(0 -1)" dimension="1"
	 */
	private char[] options;
	/**
	 * @uml.property  name="func1"
	 */
	private String func1;
	/**
	 * @uml.property  name="func2"
	 * @uml.associationEnd  
	 */
	private Bean2 func2 ;  
	
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
	 * @uml.property  name="pojoId"
	 */
	public int getPojoId() {
		return pojoId;
	}
	/**
	 * @param pojoId
	 * @uml.property  name="pojoId"
	 */
	public void setPojoId(int pojoId) {
		this.pojoId = pojoId;
	}
	/**
	 * @return
	 * @uml.property  name="options"
	 */
	public char[] getOptions() {
		return options;
	}
	/**
	 * @param options
	 * @uml.property  name="options"
	 */
	public void setOptions(char[] options) {
		this.options = options;
	}
	/**
	 * @return
	 * @uml.property  name="func1"
	 */
	public String getFunc1() {
		return func1;
	}
	/**
	 * @param func1
	 * @uml.property  name="func1"
	 */
	public void setFunc1(String func1) {
		this.func1 = func1;
	}
	/**
	 * @return
	 * @uml.property  name="func2"
	 */
	public Bean2 getFunc2() {
		return func2;
	}
	/**
	 * @param func2
	 * @uml.property  name="func2"
	 */
	public void setFunc2(Bean2 func2) {
		this.func2 = func2;
	}
	
}
