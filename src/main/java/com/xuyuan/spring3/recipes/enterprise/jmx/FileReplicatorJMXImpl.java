package com.xuyuan.spring3.recipes.enterprise.jmx;

import java.io.File;
import java.io.IOException;

import javax.management.Notification;

import org.springframework.jmx.export.annotation.ManagedAttribute;
import org.springframework.jmx.export.annotation.ManagedOperation;
import org.springframework.jmx.export.annotation.ManagedResource;
import org.springframework.jmx.export.notification.NotificationPublisher;
import org.springframework.jmx.export.notification.NotificationPublisherAware;

import com.xuyuan.spring3.recipes.enterprise.FileCopier;
import com.xuyuan.spring3.recipes.enterprise.FileReplicator;

@ManagedResource(description = "File replicator")
public class FileReplicatorJMXImpl implements FileReplicator, NotificationPublisherAware {
    /**
	 * @uml.property  name="srcDir"
	 */
    private String srcDir;
    /**
	 * @uml.property  name="destDir"
	 */
    private String destDir;
    /**
	 * @uml.property  name="fileCopier"
	 * @uml.associationEnd  
	 */
    private FileCopier fileCopier;
    /**
	 * @uml.property  name="sequenceNumber"
	 */
    private int sequenceNumber;
    /**
	 * @uml.property  name="notificationPublisher"
	 * @uml.associationEnd  
	 */
    private NotificationPublisher notificationPublisher;

    /**
	 * @return
	 * @uml.property  name="srcDir"
	 */
    @ManagedAttribute(description = "Get source directory")
    public String getSrcDir() {
        return srcDir;
    }

    /**
	 * @param srcDir
	 * @uml.property  name="srcDir"
	 */
    @ManagedAttribute(description = "Set source directory")
    public void setSrcDir(String srcDir) {
        this.srcDir = srcDir;
    }

    /**
	 * @return
	 * @uml.property  name="destDir"
	 */
    @ManagedAttribute(description = "Get destination directory")
    public String getDestDir() {
        return destDir;
    }

    /**
	 * @param destDir
	 * @uml.property  name="destDir"
	 */
    @ManagedAttribute(description = "Set destination directory")
    public void setDestDir(String destDir) {
        this.destDir = destDir;
    }

    /**
	 * @param fileCopier
	 * @uml.property  name="fileCopier"
	 */
    public void setFileCopier(FileCopier fileCopier) {
        this.fileCopier = fileCopier;
    }

    /**
	 * @param notificationPublisher
	 * @uml.property  name="notificationPublisher"
	 */
    public void setNotificationPublisher(NotificationPublisher notificationPublisher) {
        this.notificationPublisher = notificationPublisher;
    }

    @ManagedOperation(description = "Replicate files")
    public synchronized void replicate() throws IOException {
        notificationPublisher.sendNotification(new Notification("replication.start", this, sequenceNumber));

        File[] files = new File(srcDir).listFiles();

        for (File file : files) {
            if (file.isFile()) {
                fileCopier.copyFile(srcDir, destDir, file.getName());
            }
        }

        notificationPublisher.sendNotification(new Notification("replication.complete", this, sequenceNumber));
        sequenceNumber++;
    }
}
