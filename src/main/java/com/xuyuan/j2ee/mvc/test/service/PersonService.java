package com.xuyuan.j2ee.mvc.test.service;

import java.util.List;

import com.xuyuan.j2ee.ioc.annotation.Property;
import com.xuyuan.j2ee.ioc.annotation.Service;
import com.xuyuan.j2ee.mvc.test.dao.PersonDao;

@Service  
public class PersonService {  
  
    /**
	 * @uml.property  name="personDao"
	 * @uml.associationEnd  
	 */
    @Property  
    private PersonDao personDao;  
      
    public List<String> findAll(){  
        return personDao.findAll();  
    }  
      
    /**
	 * @return
	 * @uml.property  name="personDao"
	 */
    public PersonDao getPersonDao() {  
        return personDao;  
    }  
  
    /**
	 * @param personDao
	 * @uml.property  name="personDao"
	 */
    public void setPersonDao(PersonDao personDao) {  
        this.personDao = personDao;  
    }  
      
}  
