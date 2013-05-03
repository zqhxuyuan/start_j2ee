package com.xuyuan.j2ee.ioc.applicationContext;

import java.util.List;

import com.xuyuan.j2ee.ioc.annotation.Action;
import com.xuyuan.j2ee.ioc.annotation.Dao;
import com.xuyuan.j2ee.ioc.annotation.Service;
import com.xuyuan.j2ee.ioc.definition.BeanDefinition;
import com.xuyuan.j2ee.ioc.definition.BeandefinitionList;
import com.xuyuan.j2ee.ioc.definition.PropertyDefinition;
import com.xuyuan.j2ee.ioc.factory.AnnotationBeanFactory;
import com.xuyuan.j2ee.ioc.scan.ScanClass;
import com.xuyuan.j2ee.ioc.utils.BeanWrapper;

/**
 * 基于注释的上下文实例化bean类
 * @author ajun
 * @http://blog.csdn.net/ajun_studio
 */
public class AnnotationClassPathApplicationContext implements ClassPathApplicationContext {

	private static AnnotationClassPathApplicationContext cx = new AnnotationClassPathApplicationContext();
	
	private AnnotationClassPathApplicationContext(){}
	
	public static AnnotationClassPathApplicationContext getAnnotationClassPathApplicationContext(){
		if(cx!=null){
			return cx;
		}
		return new AnnotationClassPathApplicationContext();
	}
	
	public void instanceBean() {
		 List<BeanDefinition> beanDefinitions = BeandefinitionList.getBeanDefinitions();
		 if(beanDefinitions!=null && !beanDefinitions.isEmpty()){
				for(BeanDefinition bd:beanDefinitions){
					if(bd!=null){
						//初始化bean
						AnnotationBeanFactory.getBeanFactory().setBean(bd.getId(), bd.getCalssName());
					}
				}
		}
		
	}

	public void injectObject() {
		List<BeanDefinition> beanDefinitions = BeandefinitionList.getBeanDefinitions();
		for(BeanDefinition bd : beanDefinitions){
			// bean已经初始化了，再初始化bean里面的有Property注解的properties
			Object bean = AnnotationBeanFactory.getBeanFactory().getBean(bd.getId());
			List<PropertyDefinition> pds = bd.getProperties();
			if(pds!=null && !pds.isEmpty()){
				for(PropertyDefinition pd:pds){
					String name = pd.getName();
					String ref = pd.getRef();
					if(ref!=null && !"".equals(ref)){
						BeanWrapper b = new BeanWrapper(bean);
						Object propvalue = AnnotationBeanFactory.getBeanFactory().getBean(name);
						b.setPropertyValue(name, propvalue);
					}
				}
			}
		}
		
	}

	public void readAnnotationCLass() {
		Class<?> [] classes = ScanClass.getScanPackageClasses();
		if(classes != null && classes.length>0){
			for(Class<?> c:classes){
				if(c.isAnnotationPresent(Dao.class) || c.isAnnotationPresent(Service.class) || c.isAnnotationPresent(Action.class)){
					BeandefinitionList.addBeanDefinitionAndSetProperty(c);
				}
			}
		}
	}
	
	public  void init(){
		readAnnotationCLass();
		instanceBean();
		injectObject();
	}
	
}
