package com.xuyuan.cache.ehcache.cluster.rmi;

import java.io.InputStream;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.config.CacheConfiguration;
import net.sf.ehcache.config.CacheConfiguration.CacheEventListenerFactoryConfiguration;

/**
 * API方式配置Cache
 * 等价于在cache标签里配置：
 * <cacheEventListenerFactory class="net.sf.ehcache.distribution.RMICacheReplicatorFactory" />
 * @author Administrator
 *
 */
public class CacheManagerAPI {

	public static int maxSize = 100;
	
	public static CacheManager getInstance(InputStream is){
		//CacheManager singletonManager = CacheManager.getInstance();
		CacheManager manager = new CacheManager(is);
		CacheEventListenerFactoryConfiguration config = new CacheEventListenerFactoryConfiguration();
		config.setClass("net.sf.ehcache.distribution.RMICacheReplicatorFactory");
		//config.setProperties("replicateAsynchronously=true,replicatePuts=true,replicateUpdates=true,replicateUpdatesViaCopy=true,replicateRemovals=true");
		CacheConfiguration cacheConf = new CacheConfiguration("UserCache", maxSize);
		cacheConf.addCacheEventListenerFactory(config);
		
		Cache cache = new Cache(cacheConf);//创建支持RMI复制的cache
		manager.addCache(cache);//将此cache纳入manager管理
		return manager;
	}
}
