package com.xuyuan.j2ee.ioc.factory;

import java.util.HashMap;
import java.util.Map;

public class RequestMapingMap {

	private static Map<String,String> beans = new HashMap<String,String>();
	
	public static Object getBeanName(String path) {
		if(!beans.isEmpty()){
			return beans.get(path);
		}
		return new HashMap<String,String>();
	}

	public static void put(String path, String id) {
		beans.put(path, id);
		
	}

	public static Map<String,String> getRequesetMap() {
		return beans;
	}

}
