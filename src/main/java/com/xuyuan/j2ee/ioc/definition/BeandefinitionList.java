package com.xuyuan.j2ee.ioc.definition;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import com.xuyuan.j2ee.ioc.AjunIocException;
import com.xuyuan.j2ee.ioc.annotation.Action;
import com.xuyuan.j2ee.ioc.annotation.Dao;
import com.xuyuan.j2ee.ioc.annotation.Property;
import com.xuyuan.j2ee.ioc.annotation.Service;
import com.xuyuan.j2ee.ioc.factory.RequestMapingMap;
import com.xuyuan.j2ee.ioc.utils.BeanUtils;
import com.xuyuan.j2ee.mvc.annotation.RequestMapping;

/**
 * 用于存储Beandefinition
 * @author ajun
 * @http://blog.csdn.net/ajun_studio
 */
public class BeandefinitionList {

	//存储class信息类的集合
	private static List<BeanDefinition> beanDefinitions = new ArrayList<BeanDefinition>();

	/**
	 * 添加一个信息类
	 * @param bd
	 */
	public static void addBeanDefinition(BeanDefinition bd){
		beanDefinitions.add(bd);
	}
	
	/**
	 * 添加一个信息类 根据类得全名
	 * @param fullClassName com.ajun.UserDao
	 */
	public static void addBeanDefinition(String id ,String fullClassName){
		BeanDefinition bd = new BeanDefinition(id,fullClassName);
		addBeanDefinition(bd);
	}
	
	/**
	 * 添加一个信息类并且导入其对应的属性信息类
	 * @param clazz
	 */
	public static void addBeanDefinitionAndSetProperty(Class<?> clazz){
		String fullName = clazz.getName();
		String id ="";
		if(clazz.isAnnotationPresent(Dao.class)){
			id = clazz.getAnnotation(Dao.class).value();
		}else if(clazz.isAnnotationPresent(Service.class)){
			id = clazz.getAnnotation(Service.class).value();
		}else if(clazz.isAnnotationPresent(Action.class)){
			id = clazz.getAnnotation(Action.class).value();
		}
		if(id==null ||  "".equals(id.trim())){
			id = fullName.substring(fullName.lastIndexOf(".")+1).substring(0,1).toLowerCase()+ fullName.substring(fullName.lastIndexOf(".")+1).substring(1);
		}
		// class
		BeanDefinition bd  = new BeanDefinition(id,fullName);
		// properties
		Field [] fields = BeanUtils.findDeclaredFields(clazz);
		if(fields!=null && fields.length>0){
			for(Field f:fields){
				if(f.isAnnotationPresent(Property.class)){
					PropertyDefinition pd = new PropertyDefinition(f.getName(),id);
					bd.getProperties().add(pd);
				}
			}
		}
		// TODO methods? 方法上是否配置请求映射路径
		Method [] methods = BeanUtils.findDeclaredMethods(clazz);
		for(Method m : methods){
			if(m.isAnnotationPresent(RequestMapping.class)){
				String path = m.getAnnotation(RequestMapping.class).value();
				// RequestMapingMap类似于SpringMVC方法上的注解
				/**
				if(RequestMapingMap.getBeanName(path)!=null){
					throw new AjunIocException("RequestMapping's url is only ,now it is not only");
				}
				*/
				RequestMapingMap.put(path, id);
			}
		}
		addBeanDefinition(bd);
	}
	
	//返回class信息类的List
	public static List<BeanDefinition> getBeanDefinitions(){
		return beanDefinitions;
	}
}
