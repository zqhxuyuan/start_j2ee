package com.xuyuan.quartz.helloworld;

import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerUtils;
import org.quartz.impl.StdSchedulerFactory;

/**
 * Quartz Schduler 是框架的心脏与灵魂。所有的 Job 都通过 Schduler 注册；必要时，Scheduler 也会创建 Job 类的实例，并执行实例的 execute() 方法。
 *
 * 1.调用 createScheduler() 方法从 Scheduler 工厂获取一个 Scheduler 的实例。得到 Scheduler 实例之后，把它传递给 schedulerJob() 方法，由它把 Job 同 Scheduler 进行关联。
 *
 * 2.创建我们想要运行的 Job 的 JobDetail 对象。JobDetail 构造器的参数中包含指派给 Job 的名称，逻辑组名，和实现 org.quartz.Job 接口的全限类名称。
 *
 * 3.JobDetail 扮演着某一 Job 定义的角色。它带有 Job 实例的属性，能在运行时被所关联的 Job 访问到。其中在使用 JobDetail 时的一个最重要的东西就是 JobDataMap，
 * 它被用来存放 Job 实例的状态和参数。在代码中，待扫描的目录名称就是通过  scheduleJob() 方法存入到 JobDataMap 中的。
 *
 * 4.Trigger 的责任就是触发一个 Job 去执行。当用 Scheduler 注册一个 Job 的时候要创建一个 Trigger 与这个 Job 相关联。
 * 同样要给这个 trigger 实例一个名称并告诉它何时激发相应的 Job
 *
 * 5.有不只一个个 Job (你也许就是)，你将需要为每一个 Job 创建各自的 JobDetail。每一个 JobDetail 必须通过 scheduleJob() 方法一一注册到 Scheduler 上。
 * 而如果你想重用了一个 Job 类，让它产生多个实例运行，那么你需要为每个实例都创建一个 JobDetail。
 * 例如，假如你想重用 ScanDirectoryJob 让它检查两个不同的目录，你需要创建并注册两个 JobDetail 实例
 *
 * @author Administrator
 *
 */
public class SimpleScheduler {
	static Log logger = LogFactory.getLog(SimpleScheduler.class);

	public static void main(String[] args) throws SchedulerException {
		//1-4.Single Job
		SimpleScheduler simple = new SimpleScheduler();
		Scheduler scheduler = simple.createScheduler();	// Create a Scheduler and schedule the Job
		simple.scheduleJob(scheduler);
		scheduler.start();								// Start the Scheduler running

		/**
		//5.Multi Job
		simple = new SimpleScheduler();
        Scheduler scheduler = simple.createScheduler();	// Create a Scheduler and schedule the Job
        scheduler.start();								// Jobs can be scheduled after Scheduler is running
        simple.scheduleJob(scheduler, 					// Schedule the first Job
        	"ScanDirectory1",ScanDirJob.class,"D:\\conf1", 10);
        simple.scheduleJob(scheduler,					// Schedule the second Job 
        	"ScanDirectory2",ScanDirJob.class,"D:\\conf2 ", 15);

       	// JobDetail和Trigger定义在jobs.xml文件中.
       	simple = new SimpleScheduler();
       	Scheduler scheduler = simple.createScheduler();
       	scheduler.start();
       */
	}

	// 创建调度器
	public Scheduler createScheduler() throws SchedulerException {
		return StdSchedulerFactory.getDefaultScheduler();
	}

	/**
	 * Create and Schedule a ScanDirectoryJob with the Scheduler
	 * 1.Create a JobDetail for the Job
	 *   Configure the directory to scan; set the JobDataMap that is associated with the Job.
	 * 2.Create a trigger that fires every 10 seconds, forever 每10秒触发一次
	 *   Start the trigger firing from now 设置第一次触发时间
	 * 3.Associate the trigger with the job in the scheduler
	 * 
	 * @param scheduler
	 * @throws SchedulerException
	 */
	private void scheduleJob(Scheduler scheduler) throws SchedulerException {
		JobDetail jobDetail = new JobDetail("ScanDirectory", Scheduler.DEFAULT_GROUP, ScanDirJob.class);
		jobDetail.getJobDataMap().put("SCAN_DIR", "D:/webserver/apache-tomcat-6.0.32-local/conf");

		Trigger trigger = TriggerUtils.makeSecondlyTrigger(10);
		trigger.setName("scanTrigger");
		trigger.setStartTime(new Date());

		scheduler.scheduleJob(jobDetail, trigger);
	}

	private void scheduleJob(Scheduler scheduler, String jobName,Class jobClass, String scanDir, int scanInterval) throws SchedulerException {
		JobDetail jobDetail = new JobDetail(jobName,Scheduler.DEFAULT_GROUP, jobClass);
		jobDetail.getJobDataMap().put("SCAN_DIR", scanDir);

		Trigger trigger = TriggerUtils.makeSecondlyTrigger(scanInterval);
		trigger.setName(jobName + "-Trigger");
		trigger.setStartTime(new Date());

		scheduler.scheduleJob(jobDetail, trigger);
  }
}