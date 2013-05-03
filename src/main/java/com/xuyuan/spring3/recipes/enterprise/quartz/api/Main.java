package com.xuyuan.spring3.recipes.enterprise.quartz.api;

import java.util.Date;
import java.util.Map;

import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleTrigger;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xuyuan.spring3.recipes.enterprise.FileReplicator;

public class Main {

	public static void main(String[] args) throws SchedulerException {
		ApplicationContext context = new ClassPathXmlApplicationContext("spring/18/beans.xml"); 
        FileReplicator documentReplicator = (FileReplicator) context.getBean("documentReplicator"); 
 
        JobDetail job = new JobDetail(); 
        job.setName("documentReplicationJob"); 
        job.setJobClass(FileReplicationJob.class); 
        Map dataMap = job.getJobDataMap(); 
        dataMap.put("fileReplicator", documentReplicator);
        
        SimpleTrigger trigger = new SimpleTrigger(); 
        trigger.setName("documentReplicationJob"); 
        trigger.setStartTime(new Date(System.currentTimeMillis() + 5000)); 
        trigger.setRepeatCount(SimpleTrigger.REPEAT_INDEFINITELY); 
        trigger.setRepeatInterval(60000); 
 
        Scheduler scheduler = new StdSchedulerFactory().getScheduler(); 
        scheduler.start(); 
        scheduler.scheduleJob(job, trigger);
	}

}
