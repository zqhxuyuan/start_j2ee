package com.xuyuan.spring3.mvc.autocomplete;

public class User {
	/**
	 * @uml.property  name="name"
	 */
	private String name;
	/**
	 * @uml.property  name="country"
	 */
	private String country;
	/**
	 * @uml.property  name="technologies"
	 */
	private String technologies;
	
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
	 * @uml.property  name="country"
	 */
	public String getCountry() {
		return country;
	}
	/**
	 * @param country
	 * @uml.property  name="country"
	 */
	public void setCountry(String country) {
		this.country = country;
	}
	/**
	 * @return
	 * @uml.property  name="technologies"
	 */
	public String getTechnologies() {
		return technologies;
	}
	/**
	 * @param technologies
	 * @uml.property  name="technologies"
	 */
	public void setTechnologies(String technologies) {
		this.technologies = technologies;
	}
	
}
