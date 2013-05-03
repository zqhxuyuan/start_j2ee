package com.xuyuan.spring3.recipes.enterprise.mail;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xuyuan.spring3.recipes.enterprise.mail.java.ErrorNotifier;

public class Main {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("spring/18/mail.xml"); 
 
		//java:errorNotifier1  spring:errorNotifier2   template:errorNotifier3
        ErrorNotifier errorNotifier = (ErrorNotifier) context.getBean("errorNotifier3"); 
        errorNotifier.notifyCopyError("d:/tmp", "d:/tmp2", "spring.doc");
	}
}
