package com.xuyuan.cache.oscache.jgroups;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

/**
 * 测试方式：
 * 启动一个Receive，再启动多个Send
 * @author   yangzheng
 * @version  $Revision$
 * @since   2005-7-14
 */
public class TestJavaGroupBroadcastReceive {
    public static void main(String[] args) throws Exception {
        JavaGroupBroadcastingManager javaGroupBroadcastingManager = new JavaGroupBroadcastingManager();
        Properties                   properties = new Properties();
        //InputStream is = TestJavaGroupBroadcastReceive.class.getResourceAsStream("oscache-jgroups.properties");
        InputStream is = new FileInputStream("D:/115/code/start_j2ee/src/main/resources/oscache-jgroups.properties");
        properties.load(is);
        javaGroupBroadcastingManager.initialize(properties);
       
        Thread.sleep(100000000);
    }
}

