package com.xuyuan.spring3.recipes.mvc.domain;

public class SportType {

	/**
	 * @uml.property  name="id"
	 */
	private int id; 
    /**
	 * @uml.property  name="name"
	 */
    private String name;
    
    public SportType(){}
	public SportType(int id, String name) {
		this.id = id;
		this.name = name;
	}
	/**
	 * @return
	 * @uml.property  name="id"
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id
	 * @uml.property  name="id"
	 */
	public void setId(int id) {
		this.id = id;
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
    
}
