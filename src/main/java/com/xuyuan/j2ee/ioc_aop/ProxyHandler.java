package com.xuyuan.j2ee.ioc_aop;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/*
 * 代理类
 * 运用jdk动态代理实现，要求前提是被代理对象实现接口
 */
public class ProxyHandler implements InvocationHandler {
	// 存储所有切面
	private static HashMap<String, AspectInfo> aspectInfos = new HashMap<String, AspectInfo>();

	// 被代理的对象
	/**
	 * @uml.property  name="target"
	 */
	private Object target = null;

	public ProxyHandler(Object target) {
		this.target = target;
	}

	public static void addAspectInfo(AspectInfo aspectInfo) {
		aspectInfos.put(aspectInfo.getExpression(), aspectInfo);
	}

	// 获取代理实例
	public Object getProxyInstance() {
		if (target == null) {
			return null;
		}
		return Proxy.newProxyInstance(target.getClass().getClassLoader(),
				target.getClass().getInterfaces(), this);
	}

	// 获取代理实例
	public Object getProxyInstance(Object target) {
		if (target == null) {
			return null;
		}
		this.target = target;
		return Proxy.newProxyInstance(target.getClass().getClassLoader(),
				target.getClass().getInterfaces(), this);
	}

	@Override
	public Object invoke(Object proxy, Method method, Object[] args)
			throws Throwable {
		ArrayList<AspectInfo> aspects = new ArrayList<AspectInfo>();
		Set<Entry<String, AspectInfo>> entrySet = aspectInfos.entrySet();
		Object result = null;

		//遍历切面列表，找到对应的切面
		for (Entry<String, AspectInfo> entry : entrySet) {
			AspectInfo aspectInfo = entry.getValue();
			Object adviceBean = aspectInfo.getAdviceBean();
			String expression = aspectInfo.getExpression();

			Pattern pattern = Pattern.compile(expression);
			Matcher matcher = pattern.matcher(target.getClass().getName() + "." + method.getName());
			if (matcher.find()) {
				AspectInfo aspect = new AspectInfo();
				aspect.setAdviceBean(adviceBean);
				aspect.setBeforeMethod(aspectInfo.getBeforeMethod());
				aspect.setAroundMethod(aspectInfo.getAroundMethod());
				aspect.setAfterMethod(aspectInfo.getAfterMethod());
				aspects.add(aspect);
			}
		}

		// 执行before增强
		for (AspectInfo aspect : aspects) {
			Object adviceBean = aspect.getAdviceBean();
			if (aspect.getBeforeMethod() != null) {
				aspect.getBeforeMethod().invoke(adviceBean, new Object[]{});
			}
		}

		// 执行around增强
		Object aroundAdviceBean = target;
		Method aroundAdviceMethod = method;
		Object[] aroundAdviceArgs = args;
		for (AspectInfo aspect : aspects) {
			Object adviceBean = aspect.getAdviceBean();
			if (aspect.getAroundMethod() != null) {
				aroundAdviceArgs = new Object[] { new ProceedingJoinPoint(
						aroundAdviceBean, aroundAdviceMethod, aroundAdviceArgs) };
				aroundAdviceBean = adviceBean;
				aroundAdviceMethod = aspect.getAroundMethod();
			}
		}
		result = aroundAdviceMethod.invoke(aroundAdviceBean, aroundAdviceArgs);

		// 执行After增强
		for (AspectInfo aspect : aspects) {
			Object adviceBean = aspect.getAdviceBean();
			if (aspect.getAfterMethod() != null) {
				aspect.getAfterMethod().invoke(adviceBean, new Object[]{});
			}
		}
		return result;
	}

}
