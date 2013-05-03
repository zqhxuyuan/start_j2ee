package com.xuyuan.cache.memcached;

import java.util.Date;

import com.whalin.MemCached.MemCachedClient;
import com.whalin.MemCached.SockIOPool;

public class MemcachedJavaClientTest {

	// 创建全局的唯一实例
	protected static MemCachedClient mcc = new MemCachedClient();

	protected static MemcachedJavaClientTest memCached = new MemcachedJavaClientTest();

	// 设置与缓存服务器的连接池
	static {
		// 服务器列表和其权重
		// 如下设置了三个ms
		String[] servers = { "192.168.7.1:11211", "192.168.7.2:11212", "192.168.7.3:11213" };

		Integer[] weights = { 3 };

		// 获取socke连接池的实例对象
		SockIOPool pool = SockIOPool.getInstance();

		// 设置服务器信息
		pool.setServers(servers);
		pool.setWeights(weights);

		// 设置初始连接数、最小和最大连接数以及最大处理时间
		pool.setInitConn(5);
		pool.setMinConn(5);
		pool.setMaxConn(250);
		pool.setMaxIdle(1000 * 60 * 60 * 6);

		// 设置主线程的睡眠时间
		pool.setMaintSleep(30);

		// 设置TCP的参数，连接超时等
		pool.setNagle(false);
		pool.setSocketTO(3000);
		pool.setSocketConnectTO(0);

		// 初始化连接池
		pool.initialize();

		// 压缩设置，超过指定大小（单位为K）的数据都会被压缩
		mcc.setCompressEnable(true);
		mcc.setCompressThreshold(64 * 1024);
	}

	protected MemcachedJavaClientTest() {
	}

	public static MemcachedJavaClientTest getInstance() {
		return memCached;
	}

	public boolean add(String key, Object value) {
		return mcc.add(key, value);
	}

	public boolean add(String key, Object value, Date expiry) {
		return mcc.add(key, value, expiry);
	}

	public boolean replace(String key, Object value) {
		return mcc.replace(key, value);
	}

	public boolean replace(String key, Object value, Date expiry) {
		return mcc.replace(key, value, expiry);
	}

	public Object get(String key) {
		return mcc.get(key);
	}

	/**
	 * add:
	 * 1.对key foo进行哈希 
	 * 2.选择服务器 (假设根据哈希算法,选择的服务器是 192.168.7.2:11212 MS B) 
	 * 3. 连接
	 * 4.设置 key foo和value seattle
	 * 
	 * get:
	 * 1.根据key foo进行哈希知道了 key foo是在 192.168.7.2:11212 MS B 上 
	 * 2.连接192.168.7.2:11212 MS B 
	 * 3.在 192.168.7.2:11212 MS B 上根据 key foo得到相应的value seattle了
	 */
	public static void main(String[] args) {
		MemcachedJavaClientTest cache = MemcachedJavaClientTest.getInstance();
		cache.add("foo ", "seattle");
		System.out.print("get value : " + cache.get("foo"));
	}
}
