package com.xuyuan.spring3.recipes.enterprise.quartz.api;

import java.io.IOException;
import java.util.Map;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.xuyuan.spring3.recipes.enterprise.FileReplicator;

public class FileReplicationJob implements Job { 
	 
    public void execute(JobExecutionContext context) throws JobExecutionException { 
        Map dataMap = context.getJobDetail().getJobDataMap(); 
        FileReplicator fileReplicator = (FileReplicator) dataMap.get("fileReplicator"); 
        try { 
            fileReplicator.replicate(); 
        } catch (IOException e) { 
            throw new JobExecutionException(e); 
        } 
    } 
}
