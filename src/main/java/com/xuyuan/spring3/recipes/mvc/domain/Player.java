package com.xuyuan.spring3.recipes.mvc.domain;

public class Player {

	/**
	 * @uml.property  name="name"
	 */
	private String name; 
    /**
	 * @uml.property  name="phone"
	 */
    private String phone;
    
	public Player() {}    
	public Player(String name, String phone) {
		this.name = name;
		this.phone = phone;
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
	 * @uml.property  name="phone"
	 */
	public String getPhone() {
		return phone;
	}
	/**
	 * @param phone
	 * @uml.property  name="phone"
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	} 
    
}
