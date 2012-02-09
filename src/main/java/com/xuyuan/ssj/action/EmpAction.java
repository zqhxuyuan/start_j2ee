package com.xuyuan.ssj.action;

import java.util.List;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionSupport;
import com.xuyuan.ssj.model.Person;
import com.xuyuan.ssj.service.EmpService;

/**
 * @author bphillips
 * 1.添加和更新可以做成一个页面(emp-input.jsp). 
 *   则save()和update()方法可以合并为saveOrUpdate()
 *   查看也可以复用emp-input.jsp
 *   struts.xml最终只有success和input. 
 * 2.查询条件如果是name,则结果是列表.可以复用emp-list.jsp
 * 3.添加,更新,删除成功后返回主页面emp-list.jsp
 * 4.采用了Spring注解形式管理Bean,不需要有get/set方法.
 *   比如EmpAction的empService采用@Resource(name = "empService")
 *   EmpServiceImpl的empDao采用@Autowired
 *   前提是
 *   EmpServiceImpl类上注解:@Service("empService")
 *   EmpDaoJpa类上注解:@Repository("empDao")
 * 5.是否需要面向接口编程?
 */
public class EmpAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	
	private List<Person> persons;
	//private transient EmpService empService;
	@Resource(name = "empService")
	public EmpService empService;

	private Long emplid;
	private Person person;
	
	@Override
	public String execute() throws Exception {
		persons = empService.findAllEmployees();
		return SUCCESS;
	}
	
	public String add() {
		return INPUT ;
	}
	
	public String save() {
		empService.save(person); 
		return SUCCESS;
	}
	
	public String edit() {
		person = empService.findbyEmplid(emplid);
		return "edit" ;
	}
	
	public String update() {
		empService.update(person);
		return SUCCESS;
	}
	
	public String delete() {
		person = empService.findbyEmplid(emplid);
		empService.delete(person); 
		return SUCCESS;
	}
	
	public String form() {
		person = empService.findbyEmplid(emplid);
		return "form" ;
	}
	
//	public void validate() {
//		if ( person.getFirst_name().length() == 0 ){	
//			addFieldError( "person.first_name", "First name is required." );
//		}
//		if ( person.getLast_name().length() == 0 ){	
//			addFieldError( "person.last_name", "Last name is required." );
//		}
//	}
	
	public List<Person> getPersons() {
		return persons;
	}

	public void setPersons(List<Person> persons) {
		this.persons = persons;
	}

//	public EmpService getEmpService() {
//		return empService;
//	}
//
//	public void setEmpService(EmpService empService) {
//		this.empService = empService;
//	}

	public Long getEmplid() {
		return emplid;
	}

	public void setEmplid(Long emplid) {
		this.emplid = emplid;
	}

	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}
}
