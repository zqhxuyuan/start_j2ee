package com.xuyuan.cache.oscache.helloworld;

public class TestPojo {

	/**
	 * @uml.property  name="id"
	 */
	private String id;
	/**
	 * @uml.property  name="field1"
	 */
	private Integer field1;
	/**
	 * @uml.property  name="field2"
	 */
	private String field2;
	
	public TestPojo(String id) {
		this.id = id;
	}
	/**
	 * @return
	 * @uml.property  name="field1"
	 */
	public Integer getField1() {
		return field1;
	}
	/**
	 * @param field1
	 * @uml.property  name="field1"
	 */
	public void setField1(Integer field1) {
		this.field1 = field1;
	}
	/**
	 * @return
	 * @uml.property  name="field2"
	 */
	public String getField2() {
		return field2;
	}
	/**
	 * @param field2
	 * @uml.property  name="field2"
	 */
	public void setField2(String field2) {
		this.field2 = field2;
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
	
}
