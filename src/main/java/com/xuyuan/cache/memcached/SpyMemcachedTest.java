package com.xuyuan.cache.memcached;

import java.net.InetSocketAddress;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

import net.spy.memcached.AddrUtil;
import net.spy.memcached.CASResponse;
import net.spy.memcached.CASValue;
import net.spy.memcached.MemcachedClient;

import org.junit.Test;

public class SpyMemcachedTest {

	//@Test
	public void testHelloWorld() throws Exception{
		MemcachedClient cache = new MemcachedClient(new InetSocketAddress("localhost", 11211));
		cache.set("key", 3600, "HelloWorld");  // Store a value (async) for one hour
		Object myObject = cache.get("key"); // Retrieve a value (synchronously).
		System.out.println(myObject);
	}
	
	//@Test
	public void testCacheBean() throws Exception{
		MemcachedClient cache = new MemcachedClient(new InetSocketAddress("127.0.0.1", 11211));  
        for (int i = 1; i < 10; i++) {  
            cache.set("T0001" + i, 3600, new User(i + ""));   
        }  
        User myObject = (User) cache.get("T00011");  
        System.out.println("Get object from mem :" + myObject);   
	}
	
	/**
	 * A取出数据对象X  <------------------
	 * B取出数据对象X						|
	 * 									|
	 * B修改数据对象X，并将其放入缓存 <--	|
	 * 								|	|
	 * B访问数据对象:修改后的  ---------|	|
	 * A访问数据对象:修改前的  -------------|
	 * 
	 * 这样对于同一个数据对象X,得到的数据却不一致
	 * @throws Exception
	 */
	//@Test
	public void testNonCAS() throws Exception{
		MemcachedClient cache = new MemcachedClient(new InetSocketAddress("127.0.0.1", 11211));  
        cache.set("x", 1800, "Love");  
  
        //从缓存中获取数据对象x
        String obj1 = (String) cache.get("x");  
        String obj2 = (String) cache.get("x");  

        obj2 = "Michael";  //修改了数据对象x
        cache.set("x", 1800, obj2);  //将修改后的数据对象写入缓存
        
        //可见在多个Client操作时，一定会引起写不一致性的问题。
        System.out.println("Non-CAS 2:\t" + obj2); //为修改后的数据对象Michael  
        System.out.println("Non-CAS 1:\t" + obj1); //还是修改前的数据Love
	}
	
	
	@Test
	public void testCAS() throws Exception{
		MemcachedClient cache = new MemcachedClient(new InetSocketAddress("127.0.0.1", 11211));  
        cache.set("y", 1800, "Love");  
  
        CASValue casValue1 = cache.gets("y");  
        CASValue casValue2 = cache.gets("y");  
        //CASResponse response = cache.cas("y", casValue2.getCas(), casValue2.getValue());
        CASResponse response = cache.cas("y", casValue2.getCas(), "NewLove");
        System.out.println("RESPONSE:" + response.toString());

        System.out.println("CAS 2:\t" + casValue2.getCas() + " | Value 2:\t" + casValue2.getValue());  
        System.out.println("CAS 1:\t" + casValue1.getCas() + " | Value 1:\t" + casValue1.getValue());  
        System.out.println("Cache's key: " + cache.get("y"));
        System.out.println("Cache's key(CAS): " + cache.gets("y"));
	}
	
	/**
	 * Memcached异步实时读写问题的解决方案SAC
	 * http://blog.csdn.net/poechant/article/details/7201087
	 * @throws Exception
	 */
	@Test
	public void testSAC() throws Exception{
		MemcachedClient cache = new MemcachedClient(new InetSocketAddress("127.0.0.1", 11211));  
		cache.set("key", 3600, "data");  
		long casId = cache.asyncGets("key").get().getCas();  
		cache.cas("key", casId, "NewData");  
		System.out.println("CASID:" + casId);
		System.out.println(cache.get("key"));  
	}
	
	//@Test
	public void testAsync() throws Exception {
		// Get a memcached client connected to several servers
		MemcachedClient c=new MemcachedClient(AddrUtil.getAddresses("localhost:11211 localhost:11212"));

		// Try to get a value, for up to 5 seconds, and cancel if it doesn't return
		Object myObj=null;
		Future<Object> f=c.asyncGet("key");
		try {
		    myObj=f.get(5, TimeUnit.SECONDS);
		} catch(TimeoutException e) {
		    // Since we don't need this, go ahead and cancel the operation.  This
		    // is not strictly necessary, but it'll save some work on the server.
		    f.cancel(false);
		    // Do other timeout related stuff
		}
		System.out.println(myObj);
	}

}
