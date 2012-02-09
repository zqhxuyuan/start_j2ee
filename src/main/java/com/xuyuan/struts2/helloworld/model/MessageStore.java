package com.xuyuan.struts2.helloworld.model;

public class MessageStore {

	private String message;

	public MessageStore() {
		setMessage("Hello Struts User");
	}

	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	public String toString() {
		return message;
	}
}
