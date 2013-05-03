package com.xuyuan.cache.memcached;

import net.rubyeye.xmemcached.MemcachedClient;
import net.rubyeye.xmemcached.XMemcachedClient;

import org.junit.Test;

public class XmemcachedTest {

	@Test
	public void testHelloWorld() throws Exception{
		MemcachedClient client=new XMemcachedClient("localhost",11211);
		
		client.set("key",3600,"HelloWorld!"); //同步存储value到memcached，缓存超时为1小时，3600秒。
		Object someObject=client.get("key"); //从memcached获取key对应的value
		System.out.println(someObject);

		someObject=client.get("key",2000);	//从memcached获取key对应的value,操作超时2秒
		boolean success=client.touch("key",5); //更新缓存的超时时间为10秒。
		System.out.println(success);
		
		client.delete("key"); //删除value
		someObject=client.get("key");
		System.out.println(someObject);
		
	}
	
}
