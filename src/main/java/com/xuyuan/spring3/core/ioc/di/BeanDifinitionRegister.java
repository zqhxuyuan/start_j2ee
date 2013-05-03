package com.xuyuan.spring3.core.ioc.di;

import java.util.HashMap;
import java.util.Map;

/**
 * Bean定义注册表，类似于单例注册表(本质是Map)
 * @author Administrator
 */
public class BeanDifinitionRegister {

	// bean定义缓存，此处不考虑并发问题
	/**
	 * @uml.property  name="dEFINITIONS"
	 * @uml.associationEnd  qualifier="beanName:java.lang.String com.xuyuan.spring3.core.ioc.di.BeanDefinition"
	 */
	private final Map<String, BeanDefinition> DEFINITIONS = new HashMap<String, BeanDefinition>();

	public void registerBeanDefinition(String beanName, BeanDefinition bd) {
		// 1.本实现不允许覆盖Bean定义
		if (DEFINITIONS.containsKey(bd.getId())) {
			throw new RuntimeException("已存在Bean定义，此实现不允许覆盖");
		}
		// 2.将Bean定义放入Bean定义缓存池
		DEFINITIONS.put(bd.getId(), bd);
	}

	public BeanDefinition getBeanDefinition(String beanName) {
		return DEFINITIONS.get(beanName);
	}

	public boolean containsBeanDefinition(String beanName) {
		return DEFINITIONS.containsKey(beanName);
	}

}
