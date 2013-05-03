package com.xuyuan.struts2.formtags.service;

import com.xuyuan.struts2.formtags.model.Person;

/**
 * @author  Administrator
 */
public interface EditService {

	/**
	 * @uml.property  name="person"
	 * @uml.associationEnd  
	 */
	Person getPerson() ;

	void savePerson(Person personBean);

}
