package com.xuyuan.struts2.formtags.service;

import com.xuyuan.struts2.formtags.model.Person;


/**
 * Implement Services needed to edit and save
 * a Person object's state.  In this implementation
 * the Person object's state is stored in memory
 * 实际应用中,应该是从数据库读取和操作数据的.
 * @author brucephillips
 *
 */
public class EditServiceInMemory implements EditService {

	private static Person person ;
	private static String [] carModels = {"Ford","Nissan"};

	static {
		person = new Person();
		person.setFirstName("Bruce");
		person.setLastName("Phillips");
		person.setSport("basketball");
		person.setGender("not sure");
		person.setResidency("KS");
		person.setOver21(true);
		person.setCarModels(carModels);
		person.setEmail("test@qq.com");
		person.setPhoneNumber("999-999-9999");
	}

	public Person getPerson() {
		//return EditServiceInMemory.person;
		return EditServiceInMemory.person;
	}

	public void savePerson(Person personBean) {
		person.setFirstName(personBean.getFirstName() );
		person.setLastName(personBean.getLastName() );
		person.setSport(personBean.getSport() );
		person.setGender( personBean.getGender() );
		person.setResidency( personBean.getResidency() );
		person.setOver21( personBean.isOver21() );
		person.setCarModels(personBean.getCarModels() );
		person.setEmail(personBean.getEmail());
		person.setPhoneNumber(personBean.getPhoneNumber());
	}

}
