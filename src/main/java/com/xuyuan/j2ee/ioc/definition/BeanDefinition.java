package com.xuyuan.j2ee.ioc.definition;

import java.util.ArrayList;
import java.util.List;

/**
 * 读取注释bean的初始化属性,用于收集实例化bean的类
 * @author ajun
 * @http://blog.csdn.net/ajun_studio
 */
public class BeanDefinition {

	/**
	 * @uml.property  name="id"
	 */
	private String id;//默认为class的名字
	
	/**
	 * @uml.property  name="calssName"
	 */
	private String calssName;//com.ajun.bean.AjunClass
	
	//用于实现依赖注入
	/**
	 * @uml.property  name="properties"
	 * @uml.associationEnd  multiplicity="(0 -1)" elementType="com.xuyuan.j2ee.ioc.definition.PropertyDefinition"
	 */
	private List<PropertyDefinition> properties = new ArrayList<PropertyDefinition>();

	public BeanDefinition(String id, String calssName) {
		super();
		this.id = id;
		this.calssName = calssName;
	}

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
	 * @uml.property  name="calssName"
	 */
	public String getCalssName() {
		return calssName;
	}

	/**
	 * @param calssName
	 * @uml.property  name="calssName"
	 */
	public void setCalssName(String calssName) {
		this.calssName = calssName;
	}

	public List<PropertyDefinition> getProperties() {
		return properties;
	}

	public void setProperties(List<PropertyDefinition> properties) {
		this.properties = properties;
	}
}
