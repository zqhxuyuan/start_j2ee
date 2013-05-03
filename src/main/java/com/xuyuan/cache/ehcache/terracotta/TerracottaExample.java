package com.xuyuan.cache.ehcache.terracotta;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

public class TerracottaExample {
	/**
	 * @uml.property  name="cacheManager"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
	CacheManager cacheManager = new CacheManager();

	public TerracottaExample() {
		Cache cache = cacheManager.getCache("sampleTerracottaCache");
		int cacheSize = cache.getKeys().size();
		cache.put(new Element("" + cacheSize, cacheSize));
		for (Object key : cache.getKeys()) {
			System.out.println("Key:" + key);
		}
	}

	public static void main(String[] args) throws Exception {
		new TerracottaExample();
	}
}
