package com.xuyuan.ssh.web.base;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.xuyuan.ssh.common.web.StrutsAction;
import com.xuyuan.ssh.entity.base.Role;

/**
 * 1.修改默认返回结果: [参考SimpleRoleAction]
 * 如果在@Results中对RoleAction中的execute()方法返回结果进行了显式的定义，它将不再返回默认的role.jsp，
 * 而是location指定的role-list.jsp，Result注解中的name值要与返回值对应。
 * @Result(name="success",location="role-list.jsp")
 * 
 * 2.重定向:reload,redirect,redirectAction.定义在了StrutsAction中.
 * 1).添加,修改,删除记录时,要转向列表页面.则方法的返回字符串为"reload".类型为:"redirect".	==>方法之间的重定向
 *    返回字符串"reload"可以自行定义.但是类型"redirect"是struts2定义好的.
 * 2).在一个类中要转向另一个类.struts2提供了类型为"redirectAction". 						==>类之间的重定向
 * 重定向还有一个地方要注意就是:location的值是"*.action".
 * 方法之间的重定向本质也是类之间的重定向,或者说两者本质是一样的.
 * 
 * 3.是否需要定义成常量:
 * REDIRECT="redirect",REDIRECT_ACTION="redirectAction"是struts2的返回结果类型,不能改变.定义成常量.放在公共的StrutsAction中.
 * RELOAD="reload",由于不同的模块都有此需求:添加/更新/删除记录后返回到列表页面.所以也可以抽取成常量定义在公共的StrutsAction中.
 * 
 * RoleAction.ROLE_ACTION,RoleAction.REDIRECT_USER,UserAction.USER_ACTION分别定义在各自的Action里.
 * 定义成常量的目的是如果要修改值时,只需要修改变量即可.否则如果直接写成字符串,更改时,要在各个用到的地方否修改.
 * @author Administrator
 */
@Results({
	 @Result(name=StrutsAction.RELOAD,		location=RoleAction.ROLE_ACTION,		type=StrutsAction.REDIRECT)
	,@Result(name=RoleAction.REDIRECT_USER,	location=UserAction.USER_ACTION,		type=StrutsAction.REDIRECT_ACTION)
})
public class RoleAction extends StrutsAction<Role>{
	private static final long serialVersionUID = 1L;
	public static final String ROLE_ACTION = "role.action";	
	public static final String REDIRECT_USER = "redirectUser";
	
	//模拟类之间的重定向.在role.jsp页面重定向到user.jsp页面.
	//通过RoleAction的redirectUser方法重定向到user.action
	public String redirectUser(){
		return REDIRECT_USER;
	}
	
	//如果重载了StrutsAction封装好的execute()方法,如下,则列表数据为空.
	//那么应该如何重载呢.见UserAction重载的方法:doListEntity().
//	public String execute(){
//		return SUCCESS;
//	}
}