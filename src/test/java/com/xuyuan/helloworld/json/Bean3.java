package com.xuyuan.helloworld.json;

public class Bean3 {

	private Boolean bool;
	private Integer integer;
	private String string;
	public Boolean getBool() {
		return bool;
	}
	public void setBool(Boolean bool) {
		this.bool = bool;
	}
	public Integer getInteger() {
		return integer;
	}
	public void setInteger(Integer integer) {
		this.integer = integer;
	}
	public String getString() {
		return string;
	}
	public void setString(String string) {
		this.string = string;
	}
	
	@Override
	public String toString() {
		return "Bean3 [bool=" + bool + ", integer=" + integer + ", string=" + string + "]";
	}
	
}
