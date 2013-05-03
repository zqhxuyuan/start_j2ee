package com.xuyuan.spring3.core.ioc.bean;

import java.util.List;
import java.util.Map;
import java.util.Properties;

public class Hello implements IHello{

	/**
	 * @uml.property  name="message"
	 */
	private String message;
	/**
	 * @uml.property  name="msg"
	 */
	private String msg;
	
	/**
	 * @uml.property  name="values"
	 */
	private List<String> values;
	/**
	 * @uml.property  name="map"
	 */
	private Map<String,String> map;
	/**
	 * @uml.property  name="prop"
	 */
	private Properties prop;
	
	//构造方法注入
    public Hello() {
	    this.message = "Hello World!";
    }
    public Hello(String message) {
	    this.message = message;
    }

	public void hello(){
		System.out.println("say hello..." + message + msg);
	}

    //setter方法注入
	/**
	 * @param msg
	 * @uml.property  name="msg"
	 */
	public void setMsg(String msg) {
		this.msg = msg;
	}
    public void setValues(List<String> values) {
        this.values = values;
    }
	public void setMap(Map<String, String> map) {
		this.map = map;
	}
	/**
	 * @param prop
	 * @uml.property  name="prop"
	 */
	public void setProp(Properties prop) {
		this.prop = prop;
	}
}
