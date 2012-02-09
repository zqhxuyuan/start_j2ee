package com.xuyuan.ssh.common.aop;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.xuyuan.ssh.common.hibernate.HibernateDao;
import com.xuyuan.ssh.common.web.StrutsAction;
import com.xuyuan.ssh.entity.base.Log;
import com.xuyuan.ssh.entity.base.User;

/**
 * 使用AspectJ实现登录登出日志AOP
 * 在LogAspect类之上标明@Aspect注解，指定此类为一个切面类
 * 然后定义切入点与通知类型以及切入实现（一般叫做横切增强，其实就是切入之后想实现的功能）
 */
@Aspect
public class LogAspect {

	@Autowired
	@Qualifier("hibernateDao")
	private HibernateDao hibernateDao;
	
	/**
	 * 登录增强 登录的切入方法:当执行完登录操作，还没有转向到结果页面时@After执行；
	 * @param joinPoint 切入点
	 */
	@After("execution(* com.xuyuan.ssh.web.login.LoginAction.login(..))")
	public void afterLoginLog(JoinPoint joinPoint) throws Throwable{
		/**
		User user = (User)ServletActionContext.getRequest().getSession().getAttribute("user");
		if(user != null){
			saveLog(user,joinPoint); //保存日志
		}
		*/
		this.saveLog(joinPoint);
	}
	
	/**
	 * 登出增强 登出的切入方法:在执行登出之前@Before调用横切逻辑
	 * @param joinPoint 切入点
	 */
	@Before("execution(* com.xuyuan.ssh.web.login.LoginAction.logout(..))")
	public void beforeLogoutLog(JoinPoint joinPoint) throws Throwable{
		this.saveLog(joinPoint);
	}
	
	/**
	 * 操作日志 通用Action类:StrutsAction具有save delte list view input等通用的方法.
	 * 如果切入点要定位到 业务Action类. 并且记录操作日志. 应更改表达式.并在业务Action类中实现这些基本的方法.
	 * @After("execution(* com.xuyuan.ssh.web..*Action.save*(..)) OR execution(* com.xuyuan.ssh.web..*Action.delete*(..))")
	 * @param joinPoint
	 */
	@After("execution(* com.xuyuan.ssh.common.web.StrutsAction.save(..)) || execution(* com.xuyuan.ssh.common.web.StrutsAction.delete(..))")
	public void operationLog(JoinPoint joinPoint) throws Throwable{
		this.saveLog(joinPoint);
	}
	
	/**
	 * 保存日志
	 * @param joinPoint 切入点
	 */
	private void saveLog(JoinPoint joinPoint){
		User user = StrutsAction.getUserFromSession();
		Log log = new Log();
		if(user != null){
			log.setUserid(user.getId());
			log.setLoginname(user.getUsername()); //登录名
			log.setMethodname(joinPoint.getSignature().getName()); //切入方法
			String className = joinPoint.getTarget().getClass().getName();
			log.setModel(className.substring(className.lastIndexOf(".")+1,className.lastIndexOf("Action"))); //类名 -> 模块
			log.setLogtime(new Timestamp(System.currentTimeMillis())); //时间戳
			//log.setSuccess(true);
		}else if(user == null && "login".equals(joinPoint.getSignature().getName())){ 
			HttpServletRequest req = ServletActionContext.getRequest();
			log.setLogtime(new Timestamp(System.currentTimeMillis())); //时间戳
			log.setLoginname(req.getParameter("username"));
			log.setMethodname("log");
			log.setModel("Login");
			//log.setSuccess(false);
		}
		hibernateDao.save(log);
	}
	
}
