package com.xuyuan.struts2.wildcard.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.xuyuan.struts2.wildcard.model.Person;
import com.xuyuan.struts2.wildcard.service.PersonService;

/**
 * 根据form/formtags的例子,现在我们可以模拟一个简单的CRUD内存方式操作用户信息.
 * 对于CRUD,有四种操作,相应的struts2配置文件也要有四个对应的Action配置,为了简化配置,使用方法占位符.
 *
 * 官方自带的例子代码有很多可以改进的地方.
 * PersonService的实例化可以交给Spring管理
 * personList的初始化定义成空,不要交给具体的Service实现类.
 * PersonService的getPersons方法可以去掉静态的声明.
 * saveOrUpdate和delete都调用了getPersons方法,而且在PersonService的实现中save,update,delete
 * 都调用了rebuildPersonList用来刷新用户数据,是否有必要?
 *
 * 12.Wildcard Method Selection
 *
 * view.jsp input.jsp
 * @author Administrator
 *
 */
public class PersonAction extends ActionSupport {
	private static final long serialVersionUID = 1L;

	//---------------
	//PersonService personService = new PersonService();
	/**
	 * @uml.property  name="personService"
	 * @uml.associationEnd  
	 */
	private PersonService personService;

	/**
	 * @uml.property  name="personList"
	 */
	List<Person> personList = PersonService.getPersons();
	/**
	 * @uml.property  name="person"
	 * @uml.associationEnd  
	 */
	Person person ;
	/**
	 * @uml.property  name="id"
	 */
	int id ;

	//---------------
	public String execute() throws Exception {
		return SUCCESS;
	}

	public String create() {
		person = new Person();
		return INPUT;
	}

	public String edit() {
		person = personService.getPerson(id);
		return INPUT;
	}

	public String saveOrUpdate() {
		if ( person.getId()  > -1 ) {
			personService.update(person) ;
		} else {
			personService.save(person);
		}
		personList = PersonService.getPersons() ;
		return SUCCESS;
	}

	public String delete() {
		personService.deletePerson(id);
		personList = PersonService.getPersons() ;
		return SUCCESS;
	}

	//---------------
	/**
	 * @return
	 * @uml.property  name="person"
	 */
	public Person getPerson() {
		return person;
	}
	/**
	 * @param person
	 * @uml.property  name="person"
	 */
	public void setPerson(Person person) {
		this.person = person;
	}

	public List<Person> getPersonList() {
		return personList;
	}
	public void setPersonList(List<Person> personList) {
		this.personList = personList;
	}

	/**
	 * @return
	 * @uml.property  name="id"
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id
	 * @uml.property  name="id"
	 */
	public void setId(int id) {
		this.id = id;
	}

	//---------------
	/**
	 * @return
	 * @uml.property  name="personService"
	 */
	public PersonService getPersonService() {
		return personService;
	}
	/**
	 * @param personService
	 * @uml.property  name="personService"
	 */
	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}

}
