package com.xuyuan.struts2.modeldriven.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.xuyuan.struts2.modeldriven.model.User;

/**
 * 字段驱动 VS 模型驱动
 * 如果UserAction不实现ModelDriven接口,页面字段的name为:user.xxx
 *
 * 实现了ModelDriven接口后,可以去掉user.直接使用User对象的属性. 这样页面看起来更简单.
 * 当然如果实现ModelDriven接口,仍然使用user.xxx也还是可以的. 但是为什么要用呢?对吧.
 * @author vaannila
 *
 */
public class UserAction extends ActionSupport implements ModelDriven{

	/**
	 * @uml.property  name="user"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
	private User user = new User();

	//要实现这个方法
	public Object getModel() {
		return user;
	}

	public String input(){
		return INPUT;
	}

	public String execute(){
		return SUCCESS;
	}

	/**
	 * @return
	 * @uml.property  name="user"
	 */
	public User getUser() {
		return user;
	}
	/**
	 * @param user
	 * @uml.property  name="user"
	 */
	public void setUser(User user) {
		this.user = user;
	}
}
