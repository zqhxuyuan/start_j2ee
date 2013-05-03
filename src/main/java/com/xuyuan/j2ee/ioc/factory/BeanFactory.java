package com.xuyuan.j2ee.ioc.factory;

/**
 * bean工厂，扩展 对beanMap的操作
 * @author ajun
 * @http://blog.csdn.net/ajun_studio
 */
public interface BeanFactory {

	/**
	 * 设置bean
	 * @param beanName 
	 * @param fullClassName
	 */
	 void setBean(String beanName,String fullClassName);
	/**
	 * 获得bean根据beanName
	 * @param name
	 * @return
	 */
	Object getBean(String name);
	
	<T> T getBean(String name, Class<T> requiredType);
	
	<T> T getBean(Class<T> requiredType);
	
	Object getBean(String name, Object... args);
	
	boolean containsBean(String name);
	
	boolean isSingleton(String name);
	
	boolean isPrototype(String name);
	
	@SuppressWarnings("unchecked")
	boolean isTypeMatch(String name, Class targetType);
	
	Class<?> getType(String name);
	
	String[] getAliases(String name);
	
}
