package com.xuyuan.struts2.interceptors.action;

/**
 * (日志)拦截器简单运用.
 * 访问: http://localhost:8080/start_struts2/logger.action
 * 调用execute方法,会在方法前后打印 INFO.. 日志消息
 *
 * INFO: Starting execution stack for action //logger
 * Inside Action
 * INFO: Finishing execution stack for action //logger
 * @author Administrator
 *
 */
public class LoggerAction {

	public String execute(){
		System.out.println("Inside Action");
		return "success";
	}
}
