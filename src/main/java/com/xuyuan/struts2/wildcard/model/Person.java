package com.xuyuan.struts2.wildcard.model;

public class Person {

	/**
	 * @uml.property  name="id"
	 */
	private int id;
	/**
	 * @uml.property  name="firstName"
	 */
	private String firstName;
	/**
	 * @uml.property  name="lastName"
	 */
	private String lastName;

	public Person() {
		this.id = -1;
		this.firstName = null;
		this.lastName = null;
	}

	public Person(int id, String firstName, String lastName) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
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
	 * @uml.property  name="firstName"
	 */
	public String getFirstName() {
		return firstName;
	}
	/**
	 * @param firstName
	 * @uml.property  name="firstName"
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	/**
	 * @return
	 * @uml.property  name="lastName"
	 */
	public String getLastName() {
		return lastName;
	}
	/**
	 * @param lastName
	 * @uml.property  name="lastName"
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String toString() {
		return firstName + " " + lastName;
	}
}
