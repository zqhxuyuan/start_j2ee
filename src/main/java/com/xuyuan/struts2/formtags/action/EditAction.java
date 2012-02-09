package com.xuyuan.struts2.formtags.action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.xuyuan.struts2.formtags.model.Person;
import com.xuyuan.struts2.formtags.model.State;
import com.xuyuan.struts2.formtags.service.EditService;
import com.xuyuan.struts2.formtags.service.EditServiceInMemory;

/**
 * ******表单标签******
 * Acts as a controller to handle actions related to editing a Person.
 * 模拟以下情形:点击编辑按钮,显示用户信息,修改用户信息,提交后保存用户信息.
 * 使用Struts2的表单标签:select,radio,checkbox,checkboxlist.
 *
 * 变量初始化的数据以及getter方法,模拟了用户信息某个选项所有的数据.
 * 实际应用中,数据是存在数据字典中的.并且通过Service(数据库方式,非内存方式的服务类实现)从字典中读取出数据.
 *
 * 在页面上通过Struts2的标签的list属性取出值显示某个选项所有的数据.
 * 1.页面的表现数据和存储的数据是一样.比如sports,genders.  页面选择basketball,存入库的还是basketball.
 * 2.页面的表现数据和存储的数据不一样.比如states.  页面选的是Kansas,入库的是KS.
 *   则通过listKey存储真正需要入库的数据(一般是id),listValue来表现展示的数据
 *
 * 关于类型(转换)
 * 1.s:select s:radio 的list属性对应的getter方法,返回的是List类型.Bean中的类型则为String.见Person的属性sport;gender;residency
 * 2.s:checkboxlist 的list属性对应的getter方法,返回的是String[]数组,Bean中的类型也为String[],见Person的属性String[] carModels
 * 3.s:checkbox
 *
 *******XML验证表单******
 *  编写XML-validation.xml文件放在和Action同路径
 *
 *******自定义主题******
 *  编写自定义主题文件,放在webroot或classpath下.页面定义theme属性.
 *
 *******Spring和Struts******
 * 通过硬编码的方式实例化Action中的成员变量Service,会使代码的维护变得困难.从而引入了Spring的对象管理(DI).
 * 1.Action的实例化可以由Struts2自身来完成,这时候在struts.xml中action#class的配置为Action的真正路径;
 * 2.Action也可以交给Spring来管理,在Spring配置文件中定义bean的id和Action类(通常还引用Action里的成员变量进行对象管理)
 * 在struts.xml中原先action#class的定义改为引用Spring中bean#id.
 *
 * 使用Maven集成Spring和Struts2有几个注意点.Spring配置文件默认放在WEB-INF下.否则会报错找不到文件.
 * Ant方式一般把Spring配置文件放在classpath下.
 *
 * 10.Struts 2 Form Tags
 * 11.Form Validation Using XML
 * 13.Struts 2 Themes
 * 14.Spring and Struts 2
 *
 */
public class EditAction extends ActionSupport {
	private static final long serialVersionUID = 1L;

	//-----------------用户的相关信息某个选项选中的数据获取
	//private EditService editService = new EditServiceInMemory();
	private EditService editService;
	private Person personBean;

	//-----------------用户的相关信息某个选项所有的数据模拟
	private String [] sports = {"football", "baseball", "basketball" };
	private String [] genders = {"male", "female", "not sure" };
	private List<State> states ;
	private String [] carModelsAvailable = {"Ford","Chrysler","Toyota","Nissan","Niss","Nissans"};

	//-----------------模拟点击编辑,加载数据库中的数据,回显数据
	public String input() throws Exception {
		setPersonBean( editService.getPerson() );
		return INPUT;
	}

	//-----------------修改用户信息,提交后保存最新的用户信息
	public String execute() throws Exception {
		editService.savePerson(personBean);
		//editService.savePerson(getPersonBean());
		return SUCCESS;
	}

	//-----------------get方法,在页面上获取到数据进行显示
	public Person getPersonBean() {
		return personBean;
	}
	public void setPersonBean(Person person) {
		personBean = person;
	}

	public String[] getSports(){
		return sports;
	}
//	public List<String> getSports() {
//		return Arrays.asList(sports);
//	}

	public List<String> getGenders() {
		return Arrays.asList(genders);
	}

	public List<State> getStates() {
		states = new ArrayList<State>();
		states.add( new State("AZ", "Arizona") );
		states.add( new State("CA", "California") );
		states.add( new State("FL", "Florida") );
		states.add( new State("KS", "Kansas") );
		states.add( new State("NY", "New York") );
		return states;
	}

	public String [] getCarModelsAvailable() {
		return carModelsAvailable;
	}

	//-----------------DI by spring
	public EditService getEditService() {
		return editService;
	}
	public void setEditService(EditService editService) {
		this.editService = editService;
	}
}
