package com.xuyuan.j2ee.ioc.test.action;

import com.xuyuan.j2ee.ioc.annotation.Action;
import com.xuyuan.j2ee.ioc.annotation.Property;
import com.xuyuan.j2ee.ioc.test.service.UserService;

@Action
public class UserAction {

	/**
	 * @uml.property  name="userService"
	 * @uml.associationEnd  
	 */
	@Property
	private UserService userService;//注入属性
	
	public void add(){
		System.out.println("UserAction's add method was called");
		userService.add();
			
	}
	
	/**
	 * @return
	 * @uml.property  name="userService"
	 */
	public UserService getUserService() {
		return userService;
	}
	/**
	 * @param userService
	 * @uml.property  name="userService"
	 */
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	
}
