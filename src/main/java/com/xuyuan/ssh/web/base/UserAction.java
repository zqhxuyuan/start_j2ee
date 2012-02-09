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
 * 关于Convention插件模块的命名规则:
 * 1.com.xuyuan.ssh.web.UserAction
 *  访问URL:/user.action
 *  JSP页面:WEB-INF/content/user.jsp
 * 这样把JSP页面都放在了content目录下面,没有加上模块,页面一多就乱了.
 * 
 * 2.com.xuyuan.ssh.web.base.UserAction
 *  访问URL:/base/user.action
 *  JSP页面:/WEB-INF/content/base/user.jsp
 * 这样可以在content下分目录存放对应模块的页面.
 * 
 * Action上的注解@Results:
 * WHAT:注解的作用相当于配置文件中的result标签.
 * WHY:使用Result注解来设置返回类型与返回页面，是不准备采取默认的定义方式.
 * WHEN:对于有些特殊的返回类型，也需要显式的进行定义,比如重定向[RoleAction].
 * @author Administrator
 */
@Results({
	@Result(name=StrutsAction.RELOAD,location=UserAction.USER_ACTION,type=StrutsAction.REDIRECT)
})
public class UserAction extends StrutsAction<User>{
	private static final long serialVersionUID = 1L;
	public static final String USER_ACTION = "user.action";

	//查询条件
	private String username;
	private String role_id;
	
	@Autowired
	private UserManager userManager;
	@Autowired
	private RoleManager roleManager;
	
	//覆盖数据集显示回调函数
	@Override
	protected void doListEntity() throws Exception {
		list = userManager.queryResult(getRequest());
	}
	
	/**
	 * 列表页面查询条件/添加页面, 显示所有的角色. 
	 * 1.allRoles根据get方法,这里方法名为:getAllRoles.
	 * 2.定义成员变量List<Role> allRoles;
	 *   在doListEntity()写上allRoles = roleManager.getRoles();
	 */
	public List<Role> getAllRoles(){
		return roleManager.getAllRoles();
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	public String getRole_id() {
		return role_id;
	}
	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}
}
