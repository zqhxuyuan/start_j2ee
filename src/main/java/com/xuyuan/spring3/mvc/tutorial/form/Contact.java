package com.xuyuan.spring3.mvc.tutorial.form;

public class Contact {

	/**
	 * @uml.property  name="firstname"
	 */
	private String firstname;
    /**
	 * @uml.property  name="lastname"
	 */
    private String lastname;
    /**
	 * @uml.property  name="email"
	 */
    private String email;
    /**
	 * @uml.property  name="phone"
	 */
    private String phone;
	
    public Contact(String firstname, String lastname, String email, String phone) {
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.phone = phone;
	}
	
	public Contact() {
	}

	/**
	 * @return
	 * @uml.property  name="firstname"
	 */
	public String getFirstname() {
		return firstname;
	}
	/**
	 * @param firstname
	 * @uml.property  name="firstname"
	 */
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	/**
	 * @return
	 * @uml.property  name="lastname"
	 */
	public String getLastname() {
		return lastname;
	}
	/**
	 * @param lastname
	 * @uml.property  name="lastname"
	 */
	public void setLastname(String lastname) {
		this.lastname = lastname;
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
