package com.xuyuan.cache.oscache.helloworld;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import com.opensymphony.oscache.base.Cache;
import com.opensymphony.oscache.base.NeedsRefreshException;
import com.opensymphony.oscache.general.GeneralCacheAdministrator;

public class CachePojo {

	@Test
    public void testPojoCache() throws Exception {
        TestPojo pojo = new TestPojo("0001");
        pojo.setField1(100);
        pojo.setField2("100");

        // 默认加载classpath下的oscache.properties
        /**
        Properties prop = new Properties();
        InputStream is = this.getClass().getResourceAsStream("/oscache.properties");
        	//ClassLoader.getSystemResourceAsStream("/oscache.properties");
        prop.load(is);
        is.close();
        */

        GeneralCacheAdministrator admin = new GeneralCacheAdministrator();
        Cache cache = admin.getCache();
        cache.putInCache("myKey2", "myValue2");
        
        admin.putInCache("myKey", pojo);

        TestPojo cachedObj = (TestPojo) admin.getFromCache("myKey");
        //assertEquals(100, cachedObj.getField1());
        assertEquals("100", cachedObj.getField2());
        
        String myValue2 = (String)cache.getFromCache("myKey2");
        assertEquals("myValue2", myValue2);
        
        // 抛出NRE异常，正常的做法是try catch-->GeneralCacheAdministrator中建议的两种方法
        String myValue3 = (String)cache.getFromCache("myKey3");
        System.out.println(myValue3);

    }
}
