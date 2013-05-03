package com.xuyuan.struts2.annotations.action;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 使用Struts 2 Convention Plugin插件实现Struts2零配置.
 */
public class HelloAction extends ActionSupport {
	private static final long serialVersionUID = 1L;

	/**
	 * @uml.property  name="message"
	 */
	private String message;

	/**
	 * index.jsp <s:url action='hello' />
	 * 会匹配HelloAction(如果有多个这样的类,会找到第一个,因为之前的示例中有HelloAction,有可能演示时达不到效果.)
	 * 执行完毕后,return SUCCESS,会匹配webapp/WEB-INF/content/hello-success.jsp
	 */
	public String execute() throws Exception {
		message = "Hello from Struts 2 with Convention Plugin.";
		return SUCCESS;
	}

	/**
	 * @param message
	 * @uml.property  name="message"
	 */
	public void setMessage(String message) {
		this.message = message;
	}
	/**
	 * @return
	 * @uml.property  name="message"
	 */
	public String getMessage() {
		return message;
	}
}
