package com.xuyuan.cache.ehcache.helloworld;

import java.io.InputStream;
import java.lang.management.ManagementFactory;

import javax.management.MBeanServer;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;
import net.sf.ehcache.management.ManagementService;

public class EHCacheTest {

	public static void main(String[] args) {
		CacheManager cacheManager = CacheManager.create();
		cacheManager = CacheManager.getInstance();
		cacheManager = CacheManager.create("/config/ehcache.xml");
		cacheManager = CacheManager.create("http://localhost:8080/test/ehcache.xml");
		//cacheManager = CacheManager.newInstance("/config/ehcache.xml");
		
		InputStream is = EHCacheTest.class.getResourceAsStream("/ehcache.xml");
		cacheManager = new CacheManager(is);
		
		printNames(cacheManager.getCacheNames()); //打印初始缓存
		cacheManager.removeCache("sampleDistributedCache1");//移除缓存
		printNames(cacheManager.getCacheNames());

		//新建缓存
		Cache cache = new Cache("Test1", 100, true, false, 10, 10);
		cacheManager.addCache(cache);
		printNames(cacheManager.getCacheNames());
		cache.put(new Element("test1", "value1"));
		
		//得到缓存并插入值（这里监听器被调用:ehcache.xml中配置的cacheEventListenerFactory）
		cache = cacheManager.getCache("sampleCache3");
		for (int i = 0; i < 20; i++) {
			cache.put(new Element("key" + i, "value" + i));
		}
		cache.get("key10");
		
		// distributed -- rmi同步
		cache = cacheManager.getCache("sampleDistributedCache2");
		for (int i = 0; i < 100; i++) {
			cache.put(new Element("key" + i , "value" + i));
		}
		
		//注册被管理的Bean
		// JMX -- jconsole(MBeanServer)
		MBeanServer mBeanServer = ManagementFactory.getPlatformMBeanServer();
		ManagementService.registerMBeans(cacheManager, mBeanServer, true, true, true, true);

		for (int i = 0; i < 10; i++) {
			Element temp = cache.get("ehcache");
			if (temp != null) {
				System.out.println(temp.getValue());
			} else {
				System.out.println("NotFound");
			}
			try {
				Thread.sleep(10000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		// distributed cache using RMI  
        // 1.Peer Discovery -- cacheManagerPeerProviderFactory  
        // 2.CacheManager -- cacheManagerPeerListenerFactory  
        // 3.cache replication -- cacheEventListenerFactory  
        // 4.Bootstrap -- 启动后同步  
	}

	private static void printNames(String[] names) {
		for (int i = 0; i < names.length; i++) {
			System.out.println(names[i]);
		}
		System.out.println("=======================");
	}

}

