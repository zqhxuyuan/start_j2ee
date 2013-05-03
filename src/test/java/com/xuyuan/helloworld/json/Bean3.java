package com.xuyuan.helloworld.json;

public class Bean3 {

	/**
	 * @uml.property  name="bool"
	 */
	private Boolean bool;
	/**
	 * @uml.property  name="integer"
	 */
	private Integer integer;
	/**
	 * @uml.property  name="string"
	 */
	private String string;
	public Boolean getBool() {
		return bool;
	}
	/**
	 * @param bool
	 * @uml.property  name="bool"
	 */
	public void setBool(Boolean bool) {
		this.bool = bool;
	}
	/**
	 * @return
	 * @uml.property  name="integer"
	 */
	public Integer getInteger() {
		return integer;
	}
	/**
	 * @param integer
	 * @uml.property  name="integer"
	 */
	public void setInteger(Integer integer) {
		this.integer = integer;
	}
	/**
	 * @return
	 * @uml.property  name="string"
	 */
	public String getString() {
		return string;
	}
	/**
	 * @param string
	 * @uml.property  name="string"
	 */
	public void setString(String string) {
		this.string = string;
	}
	
	@Override
	public String toString() {
		return "Bean3 [bool=" + bool + ", integer=" + integer + ", string=" + string + "]";
	}
	
}
