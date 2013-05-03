package com.xuyuan.ssh.web.login;

import org.springframework.beans.factory.annotation.Autowired;

import com.xuyuan.ssh.common.web.StrutsAction;
import com.xuyuan.ssh.entity.base.User;
import com.xuyuan.ssh.service.base.UserManager;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.Preparable;

public class LoginAction extends StrutsAction implements Preparable{

	/**
	 * @uml.property  name="username"
	 */
	private String username; //登录用户名
	/**
	 * @uml.property  name="password"
	 */
	private String password; //登录密码
	
	/**
	 * @uml.property  name="userManager"
	 * @uml.associationEnd  readOnly="true"
	 */
	@Autowired
	private UserManager userManager; 
	
	/**
	 * 在index.jsp和jump.jsp: login!welcome.action即进入该方法.
	 * 执行方法返回success,按照Convention命名约定,转到WEB-INF/content/login.jsp即登录页面. 
	 */
	public String welcome(){
		return SUCCESS;
	}
	
	/**
	 * 如果把index.jsp和jump.jsp的URL改为:login.action.那么执行的是execute方法了.
	 * 但是访问时我们发现会进入死循环,不断访问页面.
	 * 即使把URL改为login!execute.action也还是会死循环.
	 */
//	public String execute(){
//		return SUCCESS;
//	}
	
	/**
	 * 这个用来干嘛?
	 */
	public String loginRedirect(){
		return "index";
	}
	
	/**
	 * 登陆认证 
	 */
	public String login(){
		User user = userManager.getUser(username, password);
		if (user == null) {
			addActionError("登录名或密码不正确!");
			return SUCCESS;
			//return Action.LOGIN;
		}
		ActionContext.getContext().getSession().put("user", user);
		return "index";
	}
	
	public String logout(){
		ActionContext.getContext().getSession().put("user", null);
		return SUCCESS;
	}
	
	/**
	 * 防止重复提示错误信息
	 */
	public void prepare() {
		clearErrorsAndMessages();
	}

	/**
	 * @return
	 * @uml.property  name="username"
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username
	 * @uml.property  name="username"
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return
	 * @uml.property  name="password"
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password
	 * @uml.property  name="password"
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	
}
