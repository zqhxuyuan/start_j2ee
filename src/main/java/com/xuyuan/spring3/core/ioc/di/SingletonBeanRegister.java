package com.xuyuan.spring3.core.ioc.di;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.config.SingletonBeanRegistry;

/**
 * 注册表方式实现单例
 * 实际上就是一个Map
 * @author Administrator
 *
 */
public class SingletonBeanRegister implements SingletonBeanRegistry {
	// 单例Bean缓存池，此处不考虑并发
	/**
	 * @uml.property  name="bEANS"
	 * @uml.associationEnd  multiplicity="(0 -1)" ordering="true" elementType="java.lang.Object" qualifier="beanName:java.lang.String java.lang.Object"
	 */
	private final Map<String, Object> BEANS = new HashMap<String, Object>();

	public boolean containsSingleton(String beanName) {
		return BEANS.containsKey(beanName);
	}

	public Object getSingleton(String beanName) {
		return BEANS.get(beanName);
	}

	@Override
	public int getSingletonCount() {
		return BEANS.size();
	}

	@Override
	public String[] getSingletonNames() {
		return BEANS.keySet().toArray(new String[0]);
	}

	@Override
	public void registerSingleton(String beanName, Object bean) {
		if (BEANS.containsKey(beanName)) {
			throw new RuntimeException("[" + beanName + "] 已存在");
		}
		BEANS.put(beanName, bean);
	}
}
