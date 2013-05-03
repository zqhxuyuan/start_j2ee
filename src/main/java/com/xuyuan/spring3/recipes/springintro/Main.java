package com.xuyuan.spring3.recipes.springintro;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

    public static void main(String[] args) {
    	// Instantiating an Application Context 
        ApplicationContext context = new ClassPathXmlApplicationContext("spring/beans.xml");
        // Getting Beans from the IoC Container 
        HelloWorld helloWorld = (HelloWorld) context.getBean("helloWorld");
        helloWorld.hello();
    }
}
