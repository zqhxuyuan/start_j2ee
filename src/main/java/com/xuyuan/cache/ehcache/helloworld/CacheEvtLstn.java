package com.xuyuan.cache.ehcache.helloworld;

import net.sf.ehcache.CacheException;
import net.sf.ehcache.Ehcache;
import net.sf.ehcache.Element;
import net.sf.ehcache.event.CacheEventListener;

public class CacheEvtLstn implements CacheEventListener {
	
	public Object clone() {
		return this;
	}
	
	public void dispose() {
		// TODO Auto-generated method stub
	}

	public void notifyElementEvicted(Ehcache arg0, Element arg1) {
		System.out.println(arg1.getKey() + "=" + arg1.getValue() + " has been evicted");
	}

	public void notifyElementExpired(Ehcache arg0, Element arg1) {
		// TODO Auto-generated method stub
	}

	public void notifyElementPut(Ehcache arg0, Element arg1) throws CacheException {
		System.out.println(arg1.getKey() + "=" + arg1.getValue() + " has been added");
	}

	public void notifyElementRemoved(Ehcache arg0, Element arg1) throws CacheException {
		// TODO Auto-generated method stub
	}

	public void notifyElementUpdated(Ehcache arg0, Element arg1) throws CacheException {
		// TODO Auto-generated method stub
	}

	public void notifyRemoveAll(Ehcache arg0) {
		// TODO Auto-generated method stub
	}

}

