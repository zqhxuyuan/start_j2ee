package com.xuyuan.struts2.formtags.service;

import com.xuyuan.struts2.formtags.model.Person;

public interface EditService {

	Person getPerson() ;

	void savePerson(Person personBean);

}
