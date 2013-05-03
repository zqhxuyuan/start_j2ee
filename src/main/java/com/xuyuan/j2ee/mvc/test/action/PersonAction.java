package com.xuyuan.j2ee.mvc.test.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xuyuan.j2ee.ioc.annotation.Action;
import com.xuyuan.j2ee.ioc.annotation.Property;
import com.xuyuan.j2ee.mvc.annotation.RequestMapping;
import com.xuyuan.j2ee.mvc.test.service.PersonService;
import com.xuyuan.j2ee.mvc.view.View;
import com.xuyuan.j2ee.mvc.view.ViewData;

@Action  
public class PersonAction {  
  
    /**
	 * @uml.property  name="personService"
	 * @uml.associationEnd  
	 */
    @Property  
    private PersonService personService;  
      
    // http://localhost:8888/start_j2ee/person/list.mvc  后缀配置在web.xml里
    @RequestMapping("person/list")//跳转路径  
    public View personList(HttpServletRequest request, HttpServletResponse response){  
        ViewData view = new ViewData();  
        List<String> list = personService.findAll();  
        view.put("list", list);//此处就是设置数据在request范围内了  
        return new View("/mvc/person/list.jsp");  
    }  
  
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