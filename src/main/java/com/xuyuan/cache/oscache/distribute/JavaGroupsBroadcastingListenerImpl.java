package com.xuyuan.cache.oscache.distribute;

import com.opensymphony.oscache.base.events.CacheEntryEvent;        
import com.opensymphony.oscache.plugins.clustersupport.*;
                      
/**        
 * oscache集群监听器，继承自jgroup的监听器，根据需要重写相应的函数来实现通知和同步更新。   
 * 
 * oscache并没有实现缓存同步，只提供了相应的通知，所以要创建一个实现类来实现，oscache.properties配置的类是创建的实现类
 * @author slzs        
 * Nov 29, 2012 9:14:00 AM        
 * each engineer has a duty to keep the code elegant        
 */
public class JavaGroupsBroadcastingListenerImpl extends JavaGroupsBroadcastingListener {  
	
    /**        
     * 处理集群通知，接收来自某个节点发来的通知，并进行相应的同步处理        
     * overriding        
     * @see com.opensymphony.oscache.plugins.clustersupport.AbstractBroadcastingListener#handleClusterNotification(com.opensymphony.oscache.plugins.clustersupport.ClusterNotification)        
     * @author: slzs        
     * Nov 29, 2012 9:16:28 AM        
     * @param message         
     * each engineer has a duty to keep the code elegant        
     */
    public void handleClusterNotification(ClusterNotification message) {        
        switch (message.getType()) {        
         case CacheConstants.CLUSTER_ENTRY_ADD:        
             System.out.println("集群新增:" + message.getData());        
             if (message.getData() instanceof SerialCacheEvent) {        
                 SerialCacheEvent event = (SerialCacheEvent) message.getData();        
                 cache.putInCache(event.getKey(), event.getEntry().getContent(), null, null, CLUSTER_ORIGIN);        
             }        
             break;        
         case CacheConstants.CLUSTER_ENTRY_UPDATE:        
             System.out.println("集群更新:" + message.getData());        
             if (message.getData() instanceof SerialCacheEvent) {        
                 SerialCacheEvent event = (SerialCacheEvent) message.getData();        
                 cache.putInCache(event.getKey(), event.getEntry().getContent(), null, null, CLUSTER_ORIGIN);        
             }        
             break;        
         case CacheConstants.CLUSTER_ENTRY_DELETE:        
             System.out.println("集群删除:" + message.getData());        
             if (message.getData() instanceof SerialCacheEvent) {        
                 SerialCacheEvent event = (SerialCacheEvent) message.getData();        
                 cache.removeEntry(event.getKey());        
             }        
             break;        
        }        
                      
    }        
                      
    /**        
     * 新增缓存后通知其它子节点        
     * overriding        
     * @see com.opensymphony.oscache.plugins.clustersupport.AbstractBroadcastingListener#cacheEntryAdded(com.opensymphony.oscache.base.events.CacheEntryEvent)        
     * @author: slzs        
     * Nov 29, 2012 9:17:29 AM        
     * @param event         
     * each engineer has a duty to keep the code elegant        
     */
    @Override   
    public void cacheEntryAdded(CacheEntryEvent event) {        
        super.cacheEntryAdded(event);        
        if (!CLUSTER_ORIGIN.equals(event.getOrigin())) {        
        	sendNotification(new ClusterNotification(CacheConstants.CLUSTER_ENTRY_ADD, new SerialCacheEvent(event.getMap(), event.getEntry(), CLUSTER_ORIGIN)));        
        }        
    }        
                      
    /**        
     * 移除缓存后通知其它子节点        
     * overriding        
     * @see com.opensymphony.oscache.plugins.clustersupport.AbstractBroadcastingListener#cacheEntryAdded(com.opensymphony.oscache.base.events.CacheEntryEvent)        
     * @author: slzs        
     * Nov 29, 2012 9:17:29 AM        
     * @param event         
     * each engineer has a duty to keep the code elegant        
     */
    @Override   
    public void cacheEntryRemoved(CacheEntryEvent event) {        
        super.cacheEntryRemoved(event);        
        if (!CLUSTER_ORIGIN.equals(event.getOrigin())) {        
        	sendNotification(new ClusterNotification(CacheConstants.CLUSTER_ENTRY_DELETE, new SerialCacheEvent(event.getMap(), event.getEntry(), CLUSTER_ORIGIN)));        
        }        
    }        
                      
    /**        
     * 更新缓存后通知其它子节点        
     * overriding        
     * @see com.opensymphony.oscache.plugins.clustersupport.AbstractBroadcastingListener#cacheEntryAdded(com.opensymphony.oscache.base.events.CacheEntryEvent)        
     * @author: slzs        
     * Nov 29, 2012 9:17:29 AM        
     * @param event         
     * each engineer has a duty to keep the code elegant        
     */
    @Override   
    public void cacheEntryUpdated(CacheEntryEvent event) {        
        super.cacheEntryUpdated(event);        
        if (!CLUSTER_ORIGIN.equals(event.getOrigin())) {        
        	sendNotification(new ClusterNotification(CacheConstants.CLUSTER_ENTRY_UPDATE, new SerialCacheEvent(event.getMap(), event.getEntry(), CLUSTER_ORIGIN)));        
        }        
    }        
                      
}
