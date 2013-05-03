package com.xuyuan.ssh.web.base;

import java.util.List;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.xuyuan.ssh.common.web.StrutsAction;
import com.xuyuan.ssh.entity.base.Role;
import com.xuyuan.ssh.entity.base.User;
import com.xuyuan.ssh.service.base.RoleManager;
import com.xuyuan.ssh.service.base.UserManager;

/**
 * struts-convention-plugin
 * ***********************************
 * 关于Convention插件模块的命名规则:
 * 1.com.xuyuan.ssh.web.WelcomeAction
 *  访问方式:/welcome.action
 *  转向页面:WEB-INF/content/welcome.jsp
 * 这样把JSP页面都放在了content目录下面,没有加上模块,页面一多就乱了.
 *
 * 可以在content下分目录存放对应模块的页面.
 * 2.com.xuyuan.ssh.web.base.UserAction
 *  访问方式:/base/user.action
 *  转向页面:/WEB-INF/content/base/user.jsp
 * 
 *  访问方式:/base/user!input.action
 *  转向页面:/WEB-INF/content/base/user-input.jsp
 * ***********************************
 *  
 * Action上的注解@Results:
 * WHAT:注解的作用相当于配置文件中的result标签.
 * WHY:使用Result注解来设置返回类型与返回页面，是不准备采取默认的定义方式.
 * WHEN:对于有些特殊的返回类型，也需要显式的进行定义,比如重定向[RoleAction].
 * 
 * 对象实例化:
 * 注意:Action上的注解@Results是Struts的,不是Spring的注解.
 * 那么一个访问URL过来的时候,是什么时候被实例化的? convention-plugin会进行实例化.而也不是Spring实例化.
 * Action里的引用变量上的注解@Autowired以及Service层,Dao层的注解属于Spring的注解,交给Spring实例化.
 * @author Administrator
 */
@Results({
	@Result(name=StrutsAction.RELOAD,location=UserAction.USER_ACTION,type=StrutsAction.REDIRECT)
})
public class UserAction extends StrutsAction<User>{
	private static final long serialVersionUID = 1L;
	public static final String USER_ACTION = "user.action";

	//查询条件
	/**
	 * @uml.property  name="username"
	 */
	private String username;
	/**
	 * @uml.property  name="role_id"
	 */
	private String role_id;
	
	/**
	 * @uml.property  name="userManager"
	 * @uml.associationEnd  readOnly="true"
	 */
	@Autowired
	private UserManager userManager;
	/**
	 * @uml.property  name="roleManager"
	 * @uml.associationEnd  readOnly="true"
	 */
	@Autowired
	private RoleManager roleManager;
	
	//覆盖数据集显示回调函数
	@Override
	protected void doListEntity() throws Exception {
		list = userManager.queryResult(getRequest());	//根据查询条件显示列表数据或者如果没有查询条件,则查询全部数据
	}
	
	/**
	 * 列表页面查询条件/添加/更新页面, 显示所有的角色. 
	 * 1.allRoles根据get方法,这里方法名为:getAllRoles.
	 * 2.定义成员变量List<Role> allRoles;
	 *   在doListEntity()方法,doInputEntity()等需要显示数据的地方都要
	 *   写上allRoles = roleManager.getRoles();
	 */
	public List<Role> getAllRoles(){
		return roleManager.getAllRoles();
	}

	/**
	 * @return
	 * @uml.property  name="username"
	 */
	public String getUsername() {
		return username;
	}
	/**
	 * @param username
	 * @uml.property  name="username"
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return
	 * @uml.property  name="role_id"
	 */
	public String getRole_id() {
		return role_id;
	}
	/**
	 * @param role_id
	 * @uml.property  name="role_id"
	 */
	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}
}
