package com.xuyuan.j2ee.ioc.applicationContext;


/**
 * 初始化上下文bean 接口
 * @author ajun
 * @http://blog.csdn.net/ajun_studio
 */
public interface  ClassPathApplicationContext {

	/**
	 * instance bean
	 */
	 void instanceBean();
	
	/**
	 * DI bean
	 */
	 void injectObject();
	
	/**
	 * read class‘s Annotation info to instance definitionBean
	 */
	 void readAnnotationCLass();
	
	 /**
	  * 初始化
	  */
	 void init();
}
