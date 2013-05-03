package com.xuyuan.cache.oscache.monitor;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.ServletContext;

import com.opensymphony.oscache.base.Cache;
import com.opensymphony.oscache.base.NeedsRefreshException;
import com.opensymphony.oscache.base.algorithm.AbstractConcurrentReadCache;
import com.opensymphony.oscache.web.ServletCacheAdministrator;

/**
 * http://jeffsang.iteye.com/blog/1692310
 * @author Administrator
 *
 */
public class OSCacheUtil {
	
	/**
	 * 通过反射机制获取Cache私有成员变量cacheMap， 2012/10/8, by jeffsang
	 * @return
	 */
	private static AbstractConcurrentReadCache getCacheMap(ServletContext ctx) {
		// 获取Cache对象实例
		Cache cache = ServletCacheAdministrator.getInstance(ctx).getAppScopeCache(ctx);

		// 通过反射机制获取Cache私有成员变量cacheMap
		AbstractConcurrentReadCache cacheMap = null;
		try {
			Field field = Cache.class.getDeclaredField("cacheMap");
			field.setAccessible(true);
			cacheMap = (AbstractConcurrentReadCache) field.get(cache);
			field.setAccessible(false);
		} catch (Exception e) {
			System.out.println("can't acquire oscache Cache.cacheMap!");
			e.printStackTrace();
		}
		return cacheMap;
	}

	/**
	 * 获取ServletCache的全部Application Scope的cache， 2012/10/8, by jeffsang
	 * 
	 * @return
	 * @throws NeedsRefreshException
	 */
	public static Map<String,Object> getAppScopeCaches(ServletContext ctx)
			throws NeedsRefreshException {
		Map<String,Object> map = new HashMap<String,Object>();

		// 获取Cache对象实例
		Cache cache = ServletCacheAdministrator.getInstance(ctx).getAppScopeCache(ctx);

		// 通过反射机制获取Cache私有成员变量cacheMap
		AbstractConcurrentReadCache cacheMap = getCacheMap(ctx);

		// 返回包含在cacheMap中的Map关系的 Set视图。
		Set<String> set = cacheMap.entrySet();

		for (Iterator<String> it = set.iterator(); it.hasNext();) {
			String k = (String) it.next();
			Object value = cache.getFromCache(k);
			map.put(k, value);
		}

		// 使用for遍历cacheMap中的entrySet
		/*
		Set<Entry> set = cacheMap.entrySet();
		for (Map.Entry entry : set) { 
			String key = (String) entry.getKey();
		 	Object value = cache.getFromCache(key); 
		 	map.put(key, value); 
		}
		 */
		return map;
	}
}
