package com.xuyuan.j2ee.ioc.test.dao;

import com.xuyuan.j2ee.ioc.annotation.Dao;

@Dao
public class UserDao {

	public void add(){
		System.out.println("UserDao's add method was called");
	}
}
