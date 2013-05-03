package com.xuyuan.j2ee.ioc.test.service;

import com.xuyuan.j2ee.ioc.annotation.Property;
import com.xuyuan.j2ee.ioc.annotation.Service;
import com.xuyuan.j2ee.ioc.test.dao.UserDao;

@Service
public class UserService {

	/**
	 * @uml.property  name="userDao"
	 * @uml.associationEnd  
	 */
	@Property
	private UserDao userDao;//注入属性

	public void add(){
		System.out.println("UserService's add method was called");
		userDao.add();
			
	}
	/**
	 * @return
	 * @uml.property  name="userDao"
	 */
	public UserDao getUserDao() {
		return userDao;
	}

	/**
	 * @param userDao
	 * @uml.property  name="userDao"
	 */
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	
}
