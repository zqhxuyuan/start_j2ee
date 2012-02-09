package com.xuyuan.quartz.helloworld;

import java.io.File;
import java.io.FileFilter;
import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

/**
 * 当 Quartz调度器(XXXScheduler=>SimpleScheduler)确定到时间要激发一个 Job(XXXJob=>ScanDirJob)的时候，它就会生成一个Job实例，并调用这个实例的 execute() 方法。 调度器只管调用 execute() 方法，而不关心执行的结果.
 *
 * 1.当 Quartz调用 execute() 方法，会传递一个 JobExecutionContext 上下文变量，里面封装有 Quartz 的运行时环境和当前正执行的 Job。
 * 通过 JobExecutionContext，你可以访问到调度器的信息，作业和作业上的触发器的信息，还有更多更多的信息。
 * 在代码中，JobExecutionContext 被用来访问JobDetail 类，JobDetail 类持有 Job 的详细信息， 包括为 Job 实例指定的名称，Job 所属组，Job 是否被持久化(易失性)，和许多其他感兴趣的属性。
 *
 * 2.JobDetail 又持有一个指向 JobDataMap 的引用。JobDataMap 中有为指定 Job 配置的自定义属性。
 * 例如，在代码中我们从 JobDataMap 中获得欲扫描的目录名，我们可以在 ScanDirectoryJob 中硬编码这个目录名，但是这样的话我们难以重用这个 Job 来扫描别的目录了。在后面你将会看到目录是如何配置到 JobDataMap 的。
 *
 * 我们已经创建了一个 Quartz job，但还没有决定怎么处置它－－明显地，我们需以某种方式为这个 Job 设置一个运行时间表。=> SimpleScheduler
 *
 * Scheduler Job JobDetail JobDataMap.其中Scheduler/Job需要我们自己实现.JobDetail/JobDataMap是可以从JobExecutionContext中获取的.
 *
 * @author
 * 扫描一个目录中的文件并显示文件的详细信息
 * http://www.unmi.cc
 * http://www.cnblogs.com/phinecos/archive/2008/09/03/1282747.html
 */
public class ScanDirJob implements Job {
	static Log logger = LogFactory.getLog(ScanDirJob.class);// 日志记录器

	public void execute(JobExecutionContext context) throws JobExecutionException {
		JobDetail jobDetail = context.getJobDetail(); // Every job has its own job detail

		String jobName = jobDetail.getName(); //任务名称 The name is defined in the job definition
		logger.info(jobName + " fired at " + new Date());// 记录任务开始执行的时间 Log the time the job started

		JobDataMap dataMap = jobDetail.getJobDataMap();// 任务所配置的数据映射表 The directory to scan is stored in the job map

		String dirName = dataMap.getString("SCAN_DIR");// 获取要扫描的目录
		if (dirName == null) {// 所需要的扫描目录没有提供 Validate the required input
			throw new JobExecutionException("Directory not configured");
		}

		File dir = new File(dirName);
		if (!dir.exists()) {// 提供的是错误目录 Make sure the directory exists
			throw new JobExecutionException("Invalid Dir " + dirName);
		}

		FileFilter filter = new FileExtensionFileFilter(".xml"); //只统计xml文件 Use FileFilter to get only XML files
		File[] files = dir.listFiles(filter);
		if (files == null || files.length <= 0) {// 目录下没有xml文件
			logger.info("No XML files found in " + dir);
			return; // Return since there were no files
		}

		int size = files.length; // The number of XML files
		for (int i = 0; i < size; i++) { // Iterate through the files found
			File file = files[i];
			File aFile = file.getAbsoluteFile();
			long fileSize = file.length();
			String msg = aFile + " - Size: " + fileSize;
			logger.info(msg);// 记录下文件的路径和大小  Log something interesting about each file.
		}
	}
}
