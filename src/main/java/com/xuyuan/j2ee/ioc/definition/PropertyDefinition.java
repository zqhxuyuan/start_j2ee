package com.xuyuan.j2ee.ioc.definition;

/**
 * 注入属性的定义,用于收集注入bean的属性
 * @author ajun
 * @http://blog.csdn.net/ajun_studio
 */
public class PropertyDefinition {

	/**
	 * @uml.property  name="name"
	 */
	private String name;//注入的属性的名字 默认为属性名字
	
	/**
	 * @uml.property  name="ref"
	 */
	private String ref;//注入到哪个bean中，bean的id

	public PropertyDefinition(String name, String ref) {
		this.name = name;//注入属性的名字
		this.ref = ref;//注入到哪个bean中 ，这个表示bean的id
	}

	/**
	 * @return
	 * @uml.property  name="name"
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 * @uml.property  name="name"
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return
	 * @uml.property  name="ref"
	 */
	public String getRef() {
		return ref;
	}

	/**
	 * @param ref
	 * @uml.property  name="ref"
	 */
	public void setRef(String ref) {
		this.ref = ref;
	}
	
}
