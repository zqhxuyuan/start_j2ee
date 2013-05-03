package com.xuyuan.cache.ehcache.cluster.rmi;

import java.io.InputStream;
import java.net.URL;       

import net.sf.ehcache.Cache;       
import net.sf.ehcache.CacheManager;       
import net.sf.ehcache.Element;       
      
/**
 * 主机B缓存开启，并从名为UserCache的缓存中循环抓取键值为“key1”的元素，直到取到，才退出循环。
 * 主机A缓存启动，并在名为UserCache的缓存中放入键值为“key1”的元素。
 * 显然，如果主机B取到的元素，那么就证明同步成功，也就是集群成功。
 * 所以在测试过程中先启动主机B的测试程序，在启动主机A的测试程序。
 * 
 * 本机测试时，主机A和主机B都为localhost，并以不同的端口模拟集群环境。
 * 首先启动Get，然后启动Put。Get会一直等待，当Put启动后，Get会得到数据，说明同步成功。
 * 
 * 在集群环境下配置Ehcache的RMI复制策略：
 * 修改Ehcache.xml配置文件，增加cacheManagerPeerProviderFactory、cacheManagerPeerListenerFactory，
 * 并为cache配置cacheEventListenerFactory来实现cache的复制策略。
 * 
 * 这样就存在一个问题，只有在Ehcache.xml中配置的cache才可以实现集群环境下的复制（本例中是ehcache_cluster1和ehcache_cluster2.xml配置的UserCache），
 * 如果我们有很多cache需要在集群环境下实现复制，把他们全部加到Ehcache中工作量会很大，并且容易出错，以后的扩展性也不够好。
 * 
 * -----------------------------------------------------
 * 增加一个节点ehcache_cluster3.xml,在ehcache_cluster1.xml和ehcache_cluster2.xml都添加第三个节点的配置：|//127.0.0.1:40003/sampleCache1
 * 测试顺序：依次启动Get，Get2，Put。当Put启动后，Get和Get2都将同步缓存，得到缓存里的数据。
 * @author Administrator
 *
 */
public class UsingCacheClusterGet {       
      
    public static void main(String[] args) throws Exception {       
		URL url = UsingCacheClusterGet.class.getClassLoader().getResource("ehcache_cluster1.xml");
        CacheManager manager = new CacheManager(url);       
        //取得Cache       
        Cache cache = manager.getCache("sampleCache1");       
      
        while(true) {       
            Element e = cache.get("key1");       
            if(e != null) {       
                System.out.println("同步缓存：" + e.getValue());       
                break;       
            }       
            Thread.sleep(1000);       
        }       
    }       
      
}
