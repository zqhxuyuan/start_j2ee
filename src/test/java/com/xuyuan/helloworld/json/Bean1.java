package com.xuyuan.helloworld.json;

public class Bean1 {
	private String name;
	private int pojoId;
	private char[] options;
	private String func1;
	private Bean2 func2 ;  
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPojoId() {
		return pojoId;
	}
	public void setPojoId(int pojoId) {
		this.pojoId = pojoId;
	}
	public char[] getOptions() {
		return options;
	}
	public void setOptions(char[] options) {
		this.options = options;
	}
	public String getFunc1() {
		return func1;
	}
	public void setFunc1(String func1) {
		this.func1 = func1;
	}
	public Bean2 getFunc2() {
		return func2;
	}
	public void setFunc2(Bean2 func2) {
		this.func2 = func2;
	}
	
}
