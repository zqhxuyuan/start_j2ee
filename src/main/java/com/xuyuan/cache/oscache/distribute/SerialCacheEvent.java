package com.xuyuan.cache.oscache.distribute;

import java.io.Serializable;           
                            
import com.opensymphony.oscache.base.Cache;           
import com.opensymphony.oscache.base.CacheEntry;           
import com.opensymphony.oscache.base.events.CacheEvent;           
                            
/**           
 * 序列信息类           
 * @author slzs           
 * Nov 29, 2012 9:37:17 AM           
 * each engineer has a duty to keep the code elegant           
 */
@SuppressWarnings("serial")           
public class SerialCacheEvent extends CacheEvent implements Serializable {           
                            
    /**
	 * @uml.property  name="map"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
    private Cache map = null;           
                            
    /**
	 * @uml.property  name="entry"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
    private CacheEntry entry = null;           
                            
    public SerialCacheEvent(Cache map, CacheEntry entry) {           
        this(map, entry, null);           
    }           
                            
    public SerialCacheEvent(Cache map, CacheEntry entry, String origin) {           
        super(origin);           
        this.map = map;           
        this.entry = entry;           
    }           
                            
    /**
	 * @return
	 * @uml.property  name="entry"
	 */
    public CacheEntry getEntry() {           
        return entry;           
    }           
                            
    public String getKey() {           
        return entry.getKey();           
    }           
                            
    /**
	 * @return
	 * @uml.property  name="map"
	 */
    public Cache getMap() {           
        return map;           
    }           
                            
    public String toString() {           
        return "key=" + entry.getKey();           
    }           
}