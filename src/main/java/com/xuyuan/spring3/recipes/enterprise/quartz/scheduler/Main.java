package com.xuyuan.spring3.recipes.enterprise.quartz.scheduler;

import org.quartz.SchedulerException;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	public static void main(String[] args) throws SchedulerException {
		new ClassPathXmlApplicationContext("spring/18/spring_scheduler.xml"); 
	}

}
