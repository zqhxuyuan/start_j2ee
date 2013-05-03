package com.xuyuan.j2ee.ioc.factory;

import java.util.HashMap;
import java.util.Map;

/**
 * 存储bean，bean实例化之后放在一个Map里 ，供我们以后进行使用。因为系统中会有很多Bean，所以放在Map里
 * @author ajun
 */
public class BeanMap {

	private static Map<String,Object> beans = new HashMap<String,Object>();
	
	private BeanMap(){}
	
	/**
	 * 添加bean
	 * @param beanName
	 * @param value
	 */
	public static void put(String beanName ,Object value){
		beans.put(beanName, value);
	}
	
	/**
	 * 获得bean
	 * @param beanName
	 * @return
	 */
	public static Object getBean(String beanName){
		if(!beans.isEmpty()){
			return beans.get(beanName);
		}
		return new HashMap<String,Object>();
	}
	
	public static Map<String,Object> getBeanMap(){
		return beans;
	}
}
