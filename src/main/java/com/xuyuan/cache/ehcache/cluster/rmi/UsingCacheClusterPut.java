package com.xuyuan.cache.ehcache.cluster.rmi;

import java.net.URL;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;
      
public class UsingCacheClusterPut {       
      
    public static void main(String[] args) throws Exception {   
		URL url = UsingCacheClusterPut.class.getClassLoader().getResource("ehcache_cluster2.xml");
        CacheManager manager = new CacheManager(url);       
        //取得Cache       
        Cache cache = manager.getCache("sampleCache1");       
        Element element = new Element("key1", "value1");       
        cache.put(element);       
        
        Cache cache2 = manager.getCache("sampleCache2");       
        Element element2 = new Element("key2", "value2");       
        cache2.put(element2);     
      
        System.out.println("放入缓存，同步到其他节点上：" + cache.get("key1").getValue());       
        System.out.println("放入缓存，同步到其他节点上：" + cache2.get("key2").getValue());       
    }       
      
} 
