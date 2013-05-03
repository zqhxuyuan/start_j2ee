package com.xuyuan.spring3.recipes.beanconfig;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xuyuan.spring3.recipes.beanconfig.t14.SequenceService;

public class Main {

    public static void main(String[] args) {
    	// 1-1 Instantiating the Spring IoC Container
        ApplicationContext context = new ClassPathXmlApplicationContext("spring/beans01_beanconfig.xml");

        SequenceGenerator generator = (SequenceGenerator) context.getBean("sequenceGenerator");

        System.out.println(generator.getSequence());
        System.out.println(generator.getSequence());
        
        
        SequenceService service = (SequenceService)context.getBean("sequenceService");
        service.generate("IT");
    }
}
