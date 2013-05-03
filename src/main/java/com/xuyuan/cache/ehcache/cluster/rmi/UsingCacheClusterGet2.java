package com.xuyuan.cache.ehcache.cluster.rmi;

import java.net.URL;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;
      
public class UsingCacheClusterGet2 {       
      
    public static void main(String[] args) throws Exception {       
    	test1();
    	//test2();
    }    
    
    public static void test1()throws InterruptedException{
    	URL url = UsingCacheClusterGet2.class.getClassLoader().getResource("ehcache_cluster3.xml");
        CacheManager manager = new CacheManager(url);       
        //取得Cache       
        Cache cache = manager.getCache("sampleCache1");       
      
        while(true) {       
            Element e = cache.get("key1");       
            if(e != null) {       
            	System.out.println("同步缓存：" + e.getValue());       
                break;       
            }       
            Thread.sleep(1000);       
        }
    }
    
    public static void test2() throws InterruptedException{
		URL url = UsingCacheClusterGet2.class.getClassLoader().getResource("ehcache_cluster1.xml");
        CacheManager manager = new CacheManager(url);       
        //取得Cache       
        Cache cache = manager.getCache("sampleCache2");       
      
        while(true) {       
            Element e = cache.get("key2");       
            if(e != null) {       
            	System.out.println("同步缓存：" + e.getValue());       
                break;       
            }       
            Thread.sleep(1000);       
        }
    }
      
}
