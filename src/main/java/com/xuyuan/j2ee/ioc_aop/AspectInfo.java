package com.xuyuan.j2ee.ioc_aop;

import java.lang.reflect.Method;

/*
 * 切面信息Bean
 * 每1个切面最多只有：
 * 1个切点expression
 * 1个增强bean
 * 1个前置增强、环绕增强、后置增强
 */
public class AspectInfo {
	/**
	 * @uml.property  name="expression"
	 */
	private String expression = "";
	/**
	 * @uml.property  name="adviceBean"
	 */
	private Object adviceBean = null;
	/**
	 * @uml.property  name="beforeMethod"
	 */
	private Method beforeMethod = null;
	/**
	 * @uml.property  name="aroundMethod"
	 */
	private Method aroundMethod = null;
	/**
	 * @uml.property  name="afterMethod"
	 */
	private Method afterMethod = null;

	public AspectInfo(){

	}

	public AspectInfo(String expression, Object adviceBean,
			Method beforeMethod, Method aroundMethod, Method afterMethod) {
		setExpression(expression);
		setAdviceBean(adviceBean);
		setBeforeMethod(beforeMethod);
		setAroundMethod(aroundMethod);
		setAfterMethod(afterMethod);
	}

	/**
	 * @return
	 * @uml.property  name="expression"
	 */
	public String getExpression() {
		return expression;
	}

	/**
	 * @param expression
	 * @uml.property  name="expression"
	 */
	public void setExpression(String expression) {
		this.expression = expression;
	}

	/**
	 * @return
	 * @uml.property  name="adviceBean"
	 */
	public Object getAdviceBean() {
		return adviceBean;
	}

	/**
	 * @param adviceBean
	 * @uml.property  name="adviceBean"
	 */
	public void setAdviceBean(Object adviceBean) {
		this.adviceBean = adviceBean;
	}

	/**
	 * @return
	 * @uml.property  name="beforeMethod"
	 */
	public Method getBeforeMethod() {
		return beforeMethod;
	}

	/**
	 * @param beforeMethod
	 * @uml.property  name="beforeMethod"
	 */
	public void setBeforeMethod(Method beforeMethod) {
		this.beforeMethod = beforeMethod;
	}

	/**
	 * @return
	 * @uml.property  name="aroundMethod"
	 */
	public Method getAroundMethod() {
		return aroundMethod;
	}

	/**
	 * @param aroundMethod
	 * @uml.property  name="aroundMethod"
	 */
	public void setAroundMethod(Method aroundMethod) {
		this.aroundMethod = aroundMethod;
	}

	/**
	 * @return
	 * @uml.property  name="afterMethod"
	 */
	public Method getAfterMethod() {
		return afterMethod;
	}

	/**
	 * @param afterMethod
	 * @uml.property  name="afterMethod"
	 */
	public void setAfterMethod(Method afterMethod) {
		this.afterMethod = afterMethod;
	}
}