package com.xuyuan.cache.aopcache;

import java.lang.reflect.Method;
import java.util.List;

import net.sf.ehcache.Cache;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.aop.AfterReturningAdvice;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.util.Assert;

public class MethodCacheAfterAdvice implements AfterReturningAdvice, InitializingBean {
	private static final Log logger = LogFactory.getLog(MethodCacheAfterAdvice.class);
	/**
	 * @uml.property  name="cache"
	 * @uml.associationEnd  
	 */
	private Cache cache;

	/**
	 * @param cache
	 * @uml.property  name="cache"
	 */
	public void setCache(Cache cache) {
		this.cache = cache;
	}

	public MethodCacheAfterAdvice() {
		super();
	}

	/**
	 * 方法中所定义的内容将会在目标方法执行后执行，在该方法中的作用是获取目标class的全名，如：com.co.cache.test.TestServiceImpl，
	 * 然后循环cache的key list，remove cache 中所有和该class相关的element
	 * 
	 * 只需要remove掉key对应的Element就可以，下次再访问get/find方法时，判断到key对应的Element为空，就会去数据库查询，再放到缓存里。
	 * 等价于刷新了缓存。
	 */
	public void afterReturning(Object arg0, Method arg1, Object[] arg2, Object arg3) throws Throwable {
		String className = arg3.getClass().getName();
		List list = cache.getKeys();
		for (int i = 0; i < list.size(); i++) {
			String cacheKey = String.valueOf(list.get(i));
			if (cacheKey.startsWith(className)) {
				cache.remove(cacheKey);
				logger.debug("remove cache " + cacheKey);
			}
		}
	}

	public void afterPropertiesSet() throws Exception {
		Assert.notNull(cache, "Need a cache. Please use setCache(Cache) create it.");
	}
}
