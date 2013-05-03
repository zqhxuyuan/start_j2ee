package com.xuyuan.test;

import java.sql.SQLException;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xuyuan.util.db.DBUtilsTest;

public class MainTest {

	/**
	 * @uml.property  name="context"
	 * @uml.associationEnd  
	 */
	ApplicationContext context; 
	
	@Before
	public void setUp() {
		context = new ClassPathXmlApplicationContext("applicationContext_test.xml");
	}
	
	@Test
    public void test01() throws SQLException {
		DBUtilsTest test = (DBUtilsTest)context.getBean("dbutilsDao");
		//test.queryByConn();
		//test.queryByDataSource();
		//test.queryBean();
		test.queryList();
	}
}
