package com.xuyuan.cache.ehcache.helloworld;

import java.util.List;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

public class HelloWorld {

	public static void main(String[] args) {
		CacheManager manager = CacheManager.create();
		manager.addCache("test");
		Cache cache1 = manager.getCache("test");
		
		Cache cache2 = new Cache("test2", 1, true, false, 5, 2);
		manager.addCache(cache2);
		
		Element ele1 = new Element("key1", "value1");
		Element ele2 = new Element("key2", "value2");
		cache1.put(ele1);
		cache2.put(ele2);
		
		List<String> l1 = cache1.getKeys();
		for(String k : l1){
			Element e = cache1.get(k);
			Object v = e.getObjectValue();
			System.out.println(k + ":" +  v);
		}
		
		manager.shutdown();
	}
}
