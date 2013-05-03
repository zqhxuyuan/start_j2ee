package com.xuyuan.ssj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xuyuan.ssj.dao.EmpDao;
import com.xuyuan.ssj.model.Person;

/**
 * Implements methods that enable interaction between a Controller and a PersonDao.
 * @author bphillips
 */
@Service("empService")
public class EmpServiceImpl implements EmpService {

	/**
	 * @uml.property  name="empDao"
	 * @uml.associationEnd  readOnly="true"
	 */
	@Autowired
	private EmpDao empDao;

	public Person findbyEmplid(Long emplid) {
		return empDao.findbyEmplid(emplid);
	}

	public List<Person> findAllEmployees() {
		return empDao.findAllEmployees();
	}

	@Transactional
	public void update(Person person) {
		empDao.update(person);
	}

	@Transactional
	public void delete(Person person) {
		empDao.delete(person);
	}

	@Transactional
	public void save(Person person) {
		empDao.save(person); // Person object's emplid instance field will now have a value
	}
	
//	public EmpDao getPersonDao() {
//		return empDao;
//	}
//	
//	public void setPersonDao(EmpDao personDao) {
//		this.empDao = personDao;
//	}
}