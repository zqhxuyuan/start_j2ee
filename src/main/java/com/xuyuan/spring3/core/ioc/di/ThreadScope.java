package com.xuyuan.spring3.core.ioc.di;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.ObjectFactory;
import org.springframework.beans.factory.config.Scope;

public class ThreadScope implements Scope {

	/**
	 * @uml.property  name="tHREAD_SCOPE"
	 * @uml.associationEnd  multiplicity="(0 -1)" elementType="java.util.Map"
	 */
	private final ThreadLocal<Map<String, Object>> THREAD_SCOPE = new ThreadLocal<Map<String, Object>>() {
		protected Map<String, Object> initialValue() {
			// 用于存放线程相关Bean
			return new HashMap<String, Object>();
		}
	};

	@Override
	public Object get(String name, ObjectFactory<?> objectFactory) {
		// 如果当前线程已经绑定了相应Bean，直接返回
		if (THREAD_SCOPE.get().containsKey(name)) {
			return THREAD_SCOPE.get().get(name);
		}
		// 使用objectFactory创建Bean并绑定到当前线程上
		THREAD_SCOPE.get().put(name, objectFactory.getObject());
		return THREAD_SCOPE.get().get(name);
	}

	@Override
	public String getConversationId() {
		return null;
	}

	@Override
	public void registerDestructionCallback(String name, Runnable callback) {
		// 此处不实现就代表类似proytotype，容器返回给用户后就不管了
	}

	@Override
	public Object remove(String name) {
		return THREAD_SCOPE.get().remove(name);
	}

	@Override
	public Object resolveContextualObject(String key) {
		return null;
	}

}