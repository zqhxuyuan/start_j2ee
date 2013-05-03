package com.xuyuan.extjs3.login.action;

import com.opensymphony.xwork2.ActionSupport;
import com.xuyuan.extjs3.login.bean.User;

/**
 * struts2整合extjs 3.0集成的简单登录例子
 * http://dos-liu.iteye.com/blog/509053 
 * 
 * http://localhost:8080/start_j2ee/extjs3/login.jsp
 * @author Administrator
 */
public class LoginDemoAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @uml.property  name="success"
	 */
	private boolean success;
	/**
	 * @uml.property  name="message"
	 */
	private String message;
	/**
	 * @uml.property  name="user"
	 * @uml.associationEnd  
	 */
	private User user;

	public String execute() throws Exception {
		if (user.getUsername().equals("admin") && user.getPassword().equals("admin")) {
			this.success = true;
			this.message = "你的帐号是：" + user.getUsername() + " 密码为：" + user.getPassword();
		} else {
			this.success = false;
			this.message = "对不起,未授权用户不能使用该系统!";
		}
		return SUCCESS;
	}

	/**
	 * @return
	 * @uml.property  name="success"
	 */
	public boolean isSuccess() {
		return success;
	}
	/**
	 * @param success
	 * @uml.property  name="success"
	 */
	public void setSuccess(boolean success) {
		this.success = success;
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
	/**
	 * @return
	 * @uml.property  name="user"
	 */
	public User getUser() {
		return user;
	}
	/**
	 * @param user
	 * @uml.property  name="user"
	 */
	public void setUser(User user) {
		this.user = user;
	}
}
