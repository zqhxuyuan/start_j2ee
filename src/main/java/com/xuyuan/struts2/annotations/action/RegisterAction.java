package com.xuyuan.struts2.annotations.action;

import org.apache.struts2.convention.annotation.Action;

import com.opensymphony.xwork2.ActionSupport;
import com.xuyuan.struts2.annotations.model.Person;

/**
 * 使用Struts 2 Convention Plugin插件实现Struts2零配置.
 *
 * 15.Struts 2 Annotations
 * content/*
 */
public class RegisterAction extends ActionSupport {
	private static final long serialVersionUID = 1L;

	/**
	 * @uml.property  name="personBean"
	 * @uml.associationEnd  
	 */
	private Person personBean;

	@Action("register-input")
	public String input() throws Exception {
		return INPUT;
	}

	public String execute() throws Exception {
		return SUCCESS;
	}

	/**
	 * @return
	 * @uml.property  name="personBean"
	 */
	public Person getPersonBean() {
		return personBean;
	}
	/**
	 * @param person
	 * @uml.property  name="personBean"
	 */
	public void setPersonBean(Person person) {
		personBean = person;
	}
}
