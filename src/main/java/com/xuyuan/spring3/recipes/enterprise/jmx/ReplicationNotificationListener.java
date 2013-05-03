package com.xuyuan.spring3.recipes.enterprise.jmx;

import javax.management.Notification;
import javax.management.NotificationListener;


public class ReplicationNotificationListener implements NotificationListener {
    public void handleNotification(Notification notification, Object handback) {
        if (notification.getType().startsWith("replication")) {
            System.out.println(notification.getSource() + " " + notification.getType() + " #" + notification.getSequenceNumber());
        }
    }
}
