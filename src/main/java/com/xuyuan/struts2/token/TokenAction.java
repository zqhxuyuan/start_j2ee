package com.xuyuan.struts2.token;

import com.opensymphony.xwork2.ActionSupport;

public class TokenAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	/**
	 * @uml.property  name="message"
	 */
	private String message;

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

	@Override
	public String execute() throws Exception {
		System.out.println("执行Action, 输出内容：" + getMessage());
		return SUCCESS;
	}
}