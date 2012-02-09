package com.xuyuan.ssj.service;

import java.util.List;

import com.xuyuan.ssj.model.Person;

/**
 * Defines behaviors a PersonService must implement to  support 
 * interaction between a Controller and PersonDao
 * @author bphillips
 */
public interface EmpService {
	public Person findbyEmplid(Long emplid);
	public List<Person> findAllEmployees();
	public void update(Person person);
	public void delete(Person person);
	public void save(Person person); 
}
