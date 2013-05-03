package com.xuyuan.spring3.recipes.mvc.domain;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * 8-12. Bean validation with Annotations (JSR-303) 
 * 9-1. Publishing a REST Service with Spring  （@XmlRootElement）
 */
@XmlRootElement 
public class Member { 
	 
    /**
	 * @uml.property  name="name"
	 */
    @NotNull 
    @Size(min=2) 
    private String name; 
  
    /**
	 * @uml.property  name="phone"
	 */
    @NotNull 
    @Size(min = 9, max = 14) 
    private String phone; 
    
    /**
	 * @uml.property  name="email"
	 */
    @Pattern(regexp=".+@.+\\.[a-z]+") 
    private String email;

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

    
}
