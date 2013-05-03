package com.xuyuan.cache.oscache.jgroups;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

/**
 * @author   yangzheng
 * @version  $Revision$
 * @since   2005-7-14
 */
public class TestJavaGroupBroadcastSend {
    public static void main(String[] args) throws Exception {
        JavaGroupBroadcastingManager javaGroupBroadcastingManager = new JavaGroupBroadcastingManager();
        Properties                   properties = new Properties();
        //InputStream is = TestJavaGroupBroadcastSend.class.getResourceAsStream("oscache-jgroups.properties");
        InputStream is = new FileInputStream("D:/115/code/start_j2ee/src/main/resources/oscache-jgroups.properties");
        properties.load(is);
        javaGroupBroadcastingManager.initialize(properties);
        String message = "hello world!";
        //while (true) {
            //Thread.sleep(5000);
            javaGroupBroadcastingManager.sendNotification(message);
        //}
    }
}

