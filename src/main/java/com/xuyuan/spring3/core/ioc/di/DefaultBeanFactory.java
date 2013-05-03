package com.xuyuan.spring3.core.ioc.di;

import org.springframework.beans.factory.config.SingletonBeanRegistry;

public class DefaultBeanFactory {

	// Bean定义注册表(Map)
	/**
	 * @uml.property  name="dEFINITIONS"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
	private BeanDifinitionRegister DEFINITIONS = new BeanDifinitionRegister();

	// 单例注册表(Map)
	/**
	 * @uml.property  name="sINGLETONS"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
	private final SingletonBeanRegistry SINGLETONS = new SingletonBeanRegister();

	// 获取Bean
	public Object getBean(String beanName) {
		// 1.验证Bean定义是否存在
		if (!DEFINITIONS.containsBeanDefinition(beanName)) {
			throw new RuntimeException("不存在[" + beanName + "]Bean定义");
		}
		// 2.获取Bean定义
		BeanDefinition bd = DEFINITIONS.getBeanDefinition(beanName);
		// 3.是否该Bean定义是单例作用域
		if (bd.getScope() == BeanDefinition.SCOPE_SINGLETON) {
			// 3.1 如果单例注册表包含Bean，则直接返回该Bean
			if (SINGLETONS.containsSingleton(beanName)) {
				return SINGLETONS.getSingleton(beanName);
			}
			// 3.2单例注册表不包含该Bean，则创建并注册到单例注册表，从而缓存
			SINGLETONS.registerSingleton(beanName, createBean(bd));
			return SINGLETONS.getSingleton(beanName);
		}
		// 4.如果是原型Bean定义,则直接返回根据Bean定义创建的新Bean，每次都是新的，无缓存
		if (bd.getScope() == BeanDefinition.SCOPE_PROTOTYPE) {
			return createBean(bd);
		}
		// 5.其他情况错误的Bean定义
		throw new RuntimeException("错误的Bean定义");
	}

	// 注册Bean定义
	public void registerBeanDefinition(BeanDefinition bd) {
		DEFINITIONS.registerBeanDefinition(bd.getId(), bd);
	}

	// 根据Bean定义中的类型信息创建Bean
	private Object createBean(BeanDefinition bd) {
		// 根据Bean定义创建Bean
		try {
			Class clazz = Class.forName(bd.getClazz());
			// 通过反射使用无参数构造器创建Bean
			return clazz.getConstructor().newInstance();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("没有找到Bean[" + bd.getId() + "]类");
		} catch (Exception e) {
			throw new RuntimeException("创建Bean[" + bd.getId() + "]失败");
		}
	}
}
