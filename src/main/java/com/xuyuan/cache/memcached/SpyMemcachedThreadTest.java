package com.xuyuan.cache.memcached;

import java.io.IOException;  
import java.net.InetSocketAddress;  
  
import net.spy.memcached.CASResponse;  
import net.spy.memcached.CASValue;  
import net.spy.memcached.MemcachedClient;  
  
/**
 * http://blog.csdn.net/poechant/article/details/7082842
 */
public class SpyMemcachedThreadTest {  
      
    private static MemcachedClient client = null;  
      
    static {  
        try {  
            client = new MemcachedClient(new InetSocketAddress("localhost", 11211));  
        } catch (IOException o) {  
        }  
    }  
  
    public static void main(String[] args) throws Exception {  
          
        client.set("numberss", 1800, 1);  
          
        SpyMemcachedThreadTest testObj = new SpyMemcachedThreadTest();  
        for (int i = 0; i < 10; i++) {   //开10个线程
            testObj.new ThreadTest("Thread-" + (i + 1)).start();  
        }  
    }  
      
    private class ThreadTest extends Thread {  
          
        private  MemcachedClient client = null;  
        
        ThreadTest(String name) throws IOException {  
            super(name);  
            client = new MemcachedClient(new InetSocketAddress("localhost", 11211));  
        }  
          
        public void run() {  
            int i = 0;  
            int success = 0;  
            while (i < 10) {  //每个线程循环10次
                i++;  
                CASValue<Object> uniqueValue =client.gets("numberss");  //从cache中取出数据对象
                CASResponse response = client.cas("numberss", uniqueValue.getCas(), (Integer)uniqueValue.getValue() + 1);  //修改数据对象,+1
  
                if (response.toString().equals("OK")) {  //对比缓存中的CAS_ID版本号,相同,则成功一次
                    success++;  
                }  
                  
                if (i == 10) //循环到最后一次 
                System.out.println(Thread.currentThread().getName() + " " +  i   
                  + " time " + " update oldValue : " + uniqueValue.getValue()   
                  +  " , result : " + response);  
            }  
              
            if (success < 10) {  //失败次数
                Count.incr(10 - success);  
                System.out.println("Test counter: " + Count.get());  
            }  
        }  
    }  
      
    public static class Count {  
        private static int counter = 0;  
        public static void incr(int x) {  
            counter += x;  
        }  
        public static int get() {  
            return counter;  
        }  
    }  
}  
