package com.xuyuan.spring3.recipes.dynascript;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("spring/beans04_dynascript.xml"); 
 
        InterestCalculator calculator = (InterestCalculator) context.getBean("interestCalculator"); 
        System.out.println(calculator.calculate(100000, 1)); 
	}
}
