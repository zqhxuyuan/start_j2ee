package com.xuyuan.cache.aopcache.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MainTest{
	public static void main(String args[]){
		ApplicationContext context =  new ClassPathXmlApplicationContext("/applicationContext_cache.xml");
		TestService testService = (TestService)context.getBean("testService");

		System.out.println("1--第一次查找并创建cache");
		testService.getAllObject();
		
		System.out.println("2--在cache中查找");
		testService.getAllObject();
		
		System.out.println("3--remove cache");
		testService.updateObject(null);
		
		System.out.println("4--需要重新查找并创建cache");
		testService.getAllObject();
	}	
}

