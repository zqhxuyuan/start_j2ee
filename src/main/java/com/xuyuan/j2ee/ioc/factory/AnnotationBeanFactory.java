package com.xuyuan.j2ee.ioc.factory;


import com.xuyuan.j2ee.ioc.annotation.Action;
import com.xuyuan.j2ee.ioc.annotation.Dao;
import com.xuyuan.j2ee.ioc.annotation.Scope;
import com.xuyuan.j2ee.ioc.annotation.Service;
import com.xuyuan.j2ee.ioc.constant.BeanScop;
import com.xuyuan.j2ee.ioc.utils.BeanUtils;

/**
 * bean工厂
 * @author ajun
 * @http://blog.csdn.net/ajun_studio
 */
public class AnnotationBeanFactory implements BeanFactory {

	private static AnnotationBeanFactory beanFactory = new AnnotationBeanFactory();
	
	private AnnotationBeanFactory(){}
	
	public static AnnotationBeanFactory getBeanFactory(){
		if(beanFactory!=null){
			return beanFactory;
		}
		return new AnnotationBeanFactory();
	}
	
	public void setBean(String beanName,String fullClassName) {
		try {
			Object bean = BeanUtils.instanceClass(Class.forName(fullClassName));
			BeanMap.put(beanName, bean);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}

	public boolean containsBean(String name) {
		Object bean = BeanMap.getBeanMap().get(name);
		if(bean!=null){
			return true;
		}
		return false;
	}


	public Object getBean(String name) {
		return BeanMap.getBeanMap().get(name);
	}

	@SuppressWarnings("unchecked")
	public <T> T getBean(String name, Class<T> requiredType) {
		Object bean = BeanMap.getBeanMap().get(name);
		if(bean!=null){
			Class<?> clazz = bean.getClass();
			if(clazz.getName().equals(requiredType.getName()) ){
				return (T)bean;
			}
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public <T> T getBean(Class<T> requiredType) {
		if(requiredType.isAnnotationPresent(Dao.class) || requiredType.isAnnotationPresent(Service.class) || requiredType.isAnnotationPresent(Action.class)){
			String fullName = requiredType.getName();
			String beanName = fullName.substring(fullName.lastIndexOf(".")+1).substring(0,1).toLowerCase()+ fullName.substring(fullName.lastIndexOf(".")+1).substring(1);
			Object bean = BeanMap.getBeanMap().get(beanName);
			return (T)bean;
		}
		
		return null;
	}

	// TODO
	public Object getBean(String name, Object... args) {
		return null;
	}

	public Class<?> getType(String name) {
		Object bean = BeanMap.getBeanMap().get(name);
		if(bean!=null){
			bean.getClass().getClass();
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public boolean isPrototype(String name) {
		Object bean = BeanMap.getBeanMap().get(name);
		if(bean!=null){
			Class clazz = bean.getClass();
			if(clazz.isAnnotationPresent(Scope.class)){
				String scopeValue = ((Scope) clazz.getAnnotation(Scope.class)).value();
				if(scopeValue!=null && BeanScop.PROTOTYPE.equals(scopeValue.trim())){
					return true;
				}
			} 
		}
		
		return false;
	}

	@SuppressWarnings("unchecked")
	public boolean isSingleton(String name) {
		Object bean = BeanMap.getBeanMap().get(name);
		if(bean!=null){
			Class clazz = bean.getClass();
			if(clazz.isAnnotationPresent(Scope.class)){
				String scopeValue = ((Scope) clazz.getAnnotation(Scope.class)).value();
				if(scopeValue!=null && BeanScop.SINGLETON.equals(scopeValue.trim())){
					return true;
				}else if(scopeValue!=null && BeanScop.PROTOTYPE.equals(scopeValue.trim())){
					return false;
				}else{
					return true;
				}
			}else{
				return true;
			}
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	public boolean isTypeMatch(String name, Class targetType) {
		Object bean = BeanMap.getBeanMap().get(name);
		if(bean!=null){
			Class clazz = bean.getClass();
			if(clazz.equals(targetType)){
				return true;
			}
		}
		return false;
	}

	// TODO
	public String[] getAliases(String name) {
		return null;
	}

}
