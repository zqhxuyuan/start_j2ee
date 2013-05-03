package com.xuyuan.spring3.recipes.enterprise.quartz.spring;

import java.io.IOException;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.xuyuan.spring3.recipes.enterprise.FileReplicator;
 
public class FileReplicationJob extends QuartzJobBean { 
 
    /**
	 * @uml.property  name="fileReplicator"
	 * @uml.associationEnd  
	 */
    private FileReplicator fileReplicator; 
 
    /**
	 * @param fileReplicator
	 * @uml.property  name="fileReplicator"
	 */
    public void setFileReplicator(FileReplicator fileReplicator) { 
        this.fileReplicator = fileReplicator; 
    } 
 
    protected void executeInternal(JobExecutionContext context) throws JobExecutionException { 
        try { 
            fileReplicator.replicate(); 
        } catch (IOException e) { 
            throw new JobExecutionException(e); 
        } 
    } 
}
