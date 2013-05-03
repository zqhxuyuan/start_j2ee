package com.xuyuan.struts2.formtags.model;

import java.util.Arrays;

/**
 * Models a Person who registers.
 * @author bruce phillips
 */
public class Person {
	/**
	 * @uml.property  name="firstName"
	 */
	private String firstName;
	/**
	 * @uml.property  name="lastName"
	 */
	private String lastName;
    /**
	 * @uml.property  name="email"
	 */
    private String email;
    /**
	 * @uml.property  name="phoneNumber"
	 */
    private String phoneNumber;
	/**
	 * @uml.property  name="sport"
	 */
	private String sport;
	/**
	 * @uml.property  name="gender"
	 */
	private String gender;
	/**
	 * @uml.property  name="residency"
	 */
	private String residency;
	/**
	 * @uml.property  name="over21"
	 */
	private boolean over21;
	/**
	 * @uml.property  name="carModels" multiplicity="(0 -1)" dimension="1"
	 */
	private String[] carModels;

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

	/**
	 * @param sport
	 * @uml.property  name="sport"
	 */
	public void setSport(String sport) {
		this.sport = sport;
	}

	/**
	 * @param gender
	 * @uml.property  name="gender"
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}

	/**
	 * @return
	 * @uml.property  name="gender"
	 */
	public String getGender() {
		return gender;
	}

	/**
	 * @return
	 * @uml.property  name="sport"
	 */
	public String getSport() {
		return sport;
	}

	/**
	 * @param residency
	 * @uml.property  name="residency"
	 */
	public void setResidency(String residency) {
		this.residency = residency;
	}

	/**
	 * @return
	 * @uml.property  name="residency"
	 */
	public String getResidency() {
		return residency;
	}

	/**
	 * @param over21
	 * @uml.property  name="over21"
	 */
	public void setOver21(boolean over21) {
		this.over21 = over21;
	}

	/**
	 * @return
	 * @uml.property  name="over21"
	 */
	public boolean isOver21() {
		return over21;
	}

	/**
	 * @param carModels
	 * @uml.property  name="carModels"
	 */
	public void setCarModels(String[] carModels) {
		this.carModels = carModels;
	}

	/**
	 * @return
	 * @uml.property  name="carModels"
	 */
	public String[] getCarModels() {
		return carModels;
	}

	/**
	 * @return
	 * @uml.property  name="email"
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email
	 * @uml.property  name="email"
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return
	 * @uml.property  name="phoneNumber"
	 */
	public String getPhoneNumber() {
		return phoneNumber;
	}

	/**
	 * @param phoneNumber
	 * @uml.property  name="phoneNumber"
	 */
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String toString() {
		return "First Name: " + getFirstName() + " | "
			+ " Last Name:  " + getLastName() + " | "
			+ " Favorite Sport: " + getSport() + " | "
			+ " Gender: " + getGender() + " | "
			+ " Residency: " + getResidency() + " | "
			+ " Over 21: " + isOver21() + " | "
			+ " Car models: " + Arrays.asList(getCarModels());

	}
}
