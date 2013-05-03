package com.xuyuan.struts2.helloworld.model;

public class MessageStore {

	/**
	 * @uml.property  name="message"
	 */
	private String message;

	public MessageStore() {
		setMessage("Hello Struts User");
	}

	/**
	 * @return
	 * @uml.property  name="message"
	 */
	public String getMessage() {
		return message;
	}
	/**
	 * @param message
	 * @uml.property  name="message"
	 */
	public void setMessage(String message) {
		this.message = message;
	}

	public String toString() {
		return message;
	}
}
