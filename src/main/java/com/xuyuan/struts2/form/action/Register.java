package com.xuyuan.struts2.form.action;

import com.opensymphony.xwork2.ActionSupport;
import com.xuyuan.struts2.form.model.Person;

/**
 * 填写表单基本资料,提交后显示填写的表单信息.
 *
 * 进入表单填写页面有2种方式:
 * 1.<a href="register.jsp">直接跳转到注册页面,这种方式不经过Action的处理,无法使用Struts2的一些预处理功能;
 * 2.通过Struts2配置,被Action方法拦截,转到页面. <action name="registerInput" method="input">转到input方法,
 * 而Action又没定义,默认是Struts2的ActionSupport的input实现.
 * 采用资源文件方式(通常用来处理国际化),在注册页面要能访问到资源文件,必须使用第二种方法.
 *
 * execute是提交表单后的处理,通常会将填写的数据入数据库.返回SUCCESS.
 * validate是提交表单时的验证方法,如果验证失败,显示错误消息,并重新返回注册页面.
 *
 * 5.Processing Forms
 * 6.Form Validation
 * 7.Message Resource Files
 *
 * register.jsp | thankyou.jsp
 * @author Administrator
 *
 */
public class Register extends ActionSupport {
	private static final long serialVersionUID = 1L;

	/**
	 * @uml.property  name="personBean"
	 * @uml.associationEnd  
	 */
	private Person personBean;

	@Override
	public String execute() throws Exception {
		// call Service class to store personBean's state in database
		return SUCCESS;
	}

	public void validate(){
		if (personBean.getFirstName().length() == 0){
			addFieldError("personBean.firstName", "First name is required.");
		}
		if (personBean.getEmail().length() == 0){
			addFieldError("personBean.email", "Email is required.");
		}
		if (personBean.getAge() < 18){
			addFieldError("personBean.age", "Age is required and must be 18 or older");
		}
	}

	/**
	 * @return
	 * @uml.property  name="personBean"
	 */
	public Person getPersonBean() {
		return personBean;
	}
	/**
	 * @param person
	 * @uml.property  name="personBean"
	 */
	public void setPersonBean(Person person) {
		personBean = person;
	}
}
