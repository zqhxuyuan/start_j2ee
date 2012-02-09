package com.xuyuan.ssh.common.interceptor;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

/**
 * 登录验证拦截器
 * 从session中取得当前登录用户，如果存在，就继续执行后面的拦截器；否则，就跳转到登录页面。
 */
public class LoginInterceptor extends MethodFilterInterceptor{

	@Override
	protected String doIntercept(ActionInvocation actioninvocation) throws Exception {
		Object user = ServletActionContext.getRequest().getSession().getAttribute("user");
		if(user != null){
			return actioninvocation.invoke(); //递归调用拦截器
		}else{
			return Action.LOGIN; //返回到登录页面
		}
	}
}
