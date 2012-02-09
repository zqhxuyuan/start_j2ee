package com.xuyuan.ssj.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.xuyuan.ssj.model.Person;

/**
 * Implements PersonDao behaviors using JPA to interact with a data repository.
 * @author bphillips
 */
@Repository("empDao")
public class EmpDaoJpa implements EmpDao {
	private static final Logger logger = Logger.getLogger(EmpDaoJpa.class.getName() );
	
	private EntityManager entityManager;

	@PersistenceContext
	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	public Person findbyEmplid(Long emplid) throws DataAccessException {
		Person person = null ;
		TypedQuery<Person> query =  entityManager.createNamedQuery("person.findByEmplid", Person.class);
		query.setParameter("emplid", emplid);
		try {
			person = query.getSingleResult() ;
		} catch (javax.persistence.NoResultException ex) {
			logger.warn("No Person was found with an emplid of " + emplid);
		}
		return person;
	}

	public List<Person> findAllEmployees() {
		TypedQuery<Person> query = entityManager.createQuery("from " + Person.class.getName(), Person.class);
		List<Person> employees = query.getResultList();
		return employees;
	}

	public void update(Person person) {
		//use merge to get the Person object into this persistence context
		entityManager.merge(person);
	}

	public void delete(Person person) {
		Person deletePerson = entityManager.merge(person);
		entityManager.remove(deletePerson);
	}

	public void save(Person person) {
		entityManager.persist(person);
	}
}
