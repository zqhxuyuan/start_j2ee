package com.xuyuan.j2ee.ioc_aop;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/*
 * 用于处理AOP代理链时，封装相关信息作为统一参数进行传递
 */
public class ProceedingJoinPoint {
	/**
	 * @uml.property  name="object"
	 */
	private Object object;//被代理的对象
	/**
	 * @uml.property  name="method"
	 */
	private Method method;//被代理的方法
	/**
	 * @uml.property  name="args" multiplicity="(0 -1)" dimension="1"
	 */
	private Object[] args;//方法相应的参数

	public ProceedingJoinPoint(Object object, Method method, Object[] args){
		this.object = object;
		this.method = method;
		this.args = args;
	}

	//执行目标函数
	public Object excute(){
		Object result = null;
		try {
			result = method.invoke(object, args);
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		return result;
	}
}
