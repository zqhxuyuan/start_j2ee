package com.xuyuan.j2ee.ioc.utils;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * 设置bean中的属性值
 * @author ajun
 * @http://blog.csdn.net/ajun_studio
 */
public class BeanWrapper {
	
	/**
	 * @uml.property  name="object"
	 */
	private Object object;
	
	public BeanWrapper(Object object) {
		super();
		this.object = object;
	}
	
	public void setPropertyValue(String name,Object value){
		try {
			PropertyDescriptor pd = new PropertyDescriptor(name,this.object.getClass());
			Method setMethod = pd.getWriteMethod();
		    setMethod.invoke(object, value);
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}catch (IntrospectionException e) {
			e.printStackTrace();
		}
	}
	
	public Object getPropertyValue(String name){
		Object value=null;
		try {
			PropertyDescriptor pd = new PropertyDescriptor(name,this.object.getClass());
			Method getMethod = pd.getReadMethod();
			value = getMethod.invoke(object);
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IntrospectionException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		return value;
	}
}

