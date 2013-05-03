package com.xuyuan.struts2.modeldriven.model;

public class User {

	/**
	 * @uml.property  name="name"
	 */
	private String name;
	/**
	 * @uml.property  name="age"
	 */
	private int age;
	/**
	 * @uml.property  name="sex"
	 */
	private String sex;
	/**
	 * @uml.property  name="hobby" multiplicity="(0 -1)" dimension="1"
	 */
	private String[] hobby;
	/**
	 * @uml.property  name="country"
	 */
	private String country;

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
	 * @uml.property  name="age"
	 */
	public int getAge() {
		return age;
	}
	/**
	 * @param age
	 * @uml.property  name="age"
	 */
	public void setAge(int age) {
		this.age = age;
	}
	/**
	 * @return
	 * @uml.property  name="sex"
	 */
	public String getSex() {
		return sex;
	}
	/**
	 * @param sex
	 * @uml.property  name="sex"
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}
	/**
	 * @return
	 * @uml.property  name="hobby"
	 */
	public String[] getHobby() {
		return hobby;
	}
	/**
	 * @param hobby
	 * @uml.property  name="hobby"
	 */
	public void setHobby(String[] hobby) {
		this.hobby = hobby;
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
}
