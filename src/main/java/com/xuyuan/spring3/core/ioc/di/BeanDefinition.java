package com.xuyuan.spring3.core.ioc.di;

/**
 * Bean“原型”：Bean定义，所有对象将根据Bean定义创建
 * @author Administrator
 *
 */
public class BeanDefinition {

	/**
	 * @uml.property  name="id"
	 */
	private String id; 		// 唯一标识
	/**
	 * @uml.property  name="clazz"
	 */
	private String clazz; 	// 原型类：class全限定名
	
	public static final int SCOPE_SINGLETON = 0; 	// 单例
	public static final int SCOPE_PROTOTYPE = 1; 	// 原型
	/**
	 * @uml.property  name="scope"
	 */
	private int scope = SCOPE_SINGLETON; 			// 作用域

	/**
	 * @return
	 * @uml.property  name="id"
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id
	 * @uml.property  name="id"
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return
	 * @uml.property  name="clazz"
	 */
	public String getClazz() {
		return clazz;
	}

	/**
	 * @param clazz
	 * @uml.property  name="clazz"
	 */
	public void setClazz(String clazz) {
		this.clazz = clazz;
	}

	/**
	 * @return
	 * @uml.property  name="scope"
	 */
	public int getScope() {
		return scope;
	}

	/**
	 * @param scope
	 * @uml.property  name="scope"
	 */
	public void setScope(int scope) {
		this.scope = scope;
	}

	public static int getScopeSingleton() {
		return SCOPE_SINGLETON;
	}

	public static int getScopePrototype() {
		return SCOPE_PROTOTYPE;
	}

}
