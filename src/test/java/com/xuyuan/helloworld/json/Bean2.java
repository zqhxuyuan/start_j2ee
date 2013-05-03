package com.xuyuan.helloworld.json;

public class Bean2 {

	/**
	 * @uml.property  name="field1" multiplicity="(0 -1)" dimension="1"
	 */
	private String[] field1;
	/**
	 * @uml.property  name="field2"
	 */
	private String field2;
	/**
	 * @return
	 * @uml.property  name="field1"
	 */
	public String[] getField1() {
		return field1;
	}
	/**
	 * @param field1
	 * @uml.property  name="field1"
	 */
	public void setField1(String[] field1) {
		this.field1 = field1;
	}
	/**
	 * @return
	 * @uml.property  name="field2"
	 */
	public String getField2() {
		return field2;
	}
	/**
	 * @param field2
	 * @uml.property  name="field2"
	 */
	public void setField2(String field2) {
		this.field2 = field2;
	}
	
}
