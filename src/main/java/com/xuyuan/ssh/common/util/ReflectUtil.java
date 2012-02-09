package com.xuyuan.ssh.common.util;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

/**
 * 反射工具类
 */
public class ReflectUtil {
	
	/**
	 * 获得超类的参数类型，取第一个参数类型
	 * @param <T> 类型参数
	 * @param clazz 超类类型
	 */
	public static <T> Class<T> getClassGenricType(final Class clazz) {
		return getClassGenricType(clazz, 0);
	}
	
	/**
	 * 根据索引获得超类的参数类型
	 * @param clazz 超类类型
	 * @param index 索引
	 */
	public static Class getClassGenricType(final Class clazz, final int index) {
		Type genType = clazz.getGenericSuperclass();
		if (!(genType instanceof ParameterizedType)) {
			return Object.class;
		}
		Type[] params = ((ParameterizedType)genType).getActualTypeArguments();
		if (index >= params.length || index < 0) {
			return Object.class;
		}
		if (!(params[index] instanceof Class)) {
			return Object.class;
		}
		return (Class) params[index];
	}
}
