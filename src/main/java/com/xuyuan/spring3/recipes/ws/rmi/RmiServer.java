package com.xuyuan.spring3.recipes.ws.rmi;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class RmiServer {

	public static void main(String[] args) { 
        new ClassPathXmlApplicationContext("rmi-server.xml"); 
    } 
}
