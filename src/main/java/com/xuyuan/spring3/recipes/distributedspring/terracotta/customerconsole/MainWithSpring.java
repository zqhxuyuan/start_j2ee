package com.xuyuan.spring3.recipes.distributedspring.terracotta.customerconsole;

import com.xuyuan.spring3.recipes.distributedspring.terracotta.customerconsole.view.CustomerConsole;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * create z qh  1/10/2013
 * 
 */
public class MainWithSpring {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring/22/beans.xml");
        CustomerConsole customerConsole = (CustomerConsole) context.getBean("customerConsole");

        while (true) {
            customerConsole.handleNextCommand("Welcome to the customer console: your choices are DELETE, UPDATE, CREATE or LIST");
        }
    }
}
