package com.xuyuan.j2ee.ioc.test;

import com.xuyuan.j2ee.ioc.applicationContext.AnnotationClassPathApplicationContext;
import com.xuyuan.j2ee.ioc.applicationContext.ClassPathApplicationContext;
import com.xuyuan.j2ee.ioc.factory.AnnotationBeanFactory;
import com.xuyuan.j2ee.ioc.test.action.UserAction;

public class Test {

	public static void main(String [] ag){
		ClassPathApplicationContext cx = AnnotationClassPathApplicationContext.getAnnotationClassPathApplicationContext();
		cx.init();
		UserAction action = AnnotationBeanFactory.getBeanFactory().getBean("userAction",UserAction.class);
		action.add();
	}
}
