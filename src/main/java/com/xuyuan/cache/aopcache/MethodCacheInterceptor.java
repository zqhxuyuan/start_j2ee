package com.xuyuan.cache.aopcache;

import java.io.Serializable;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;

import net.sf.ehcache.Cache;
import net.sf.ehcache.Element;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

//import com.tudou.tudouadsales.component.service.GlobalAutowired;
//import com.tudou.tudouadsales.component.utils.DateUtils;

/**
 * http://ahuaxuan.iteye.com/blog/263895
 * 使用任意一个现有开源Cache Framework，要求可以Cache系统中Service或则DAO层的get/find等方法返回结果，
 * 如果数据更新（使用Create/update/delete方法），则刷新cache中相应的内容。
 * 
 * 使用Spring AOP + ehCache来实现:
 * 1. 创建一个实现了MethodInterceptor接口的拦截器,用来拦截Service/DAO的方法调用，拦截到方法后，搜索该方法的结果在cache中是否存在，
 * 如果存在，返回cache中的缓存结果，如果不存在，返回查询数据库的结果，并将结果缓存到cache中
 * 
 * 2. 再建立一个拦截器MethodCacheAfterAdvice，作用是在用户进行create/update/delete操作时来刷新/remove 相关cache内容，
 * 这个拦截器实现了AfterReturningAdvice接口，将会在所拦截的方法执行后执行
 * 在public void afterReturning(Object arg0, Method arg1,Object[] arg2, Object arg3)方法中所预定的操作
 * 
 * 方法里执行的操作
 * @author ahuaxuan(aaron zhang)
 * @since 2008-5-13
 * @version $Id: MethodCacheInterceptor.java 1879 2008-11-07 02:58:36Z aaron $
 */
@Component("methodCacheInterceptor")
//@GlobalAutowired
public class MethodCacheInterceptor implements MethodInterceptor {

	private static transient Log logger = LogFactory.getLog(MethodCacheInterceptor.class);
	
	private static final String CACHENAME_SPLIT_CHAR = "#";
	
	/**
	 * @uml.property  name="cache"
	 * @uml.associationEnd  
	 */
	private Cache cache;

	/**
	 * @param cache
	 * @uml.property  name="cache"
	 */
	public void setCache(Cache cache) {
		this.cache = cache;
	}

	/**
	 * Make sure that every bean which has been intercepted must has a interface,
	 * pls do not use CGLIB to PROXY class.
	 * @see org.aopalliance.intercept.MethodInterceptor#invoke(org.aopalliance.intercept.MethodInvocation)
	 */
	@SuppressWarnings("unchecked")
	public Object invoke(MethodInvocation invocation) throws Throwable {
		String targetName = invocation.getThis().getClass().getInterfaces()[0].getName();
		String methodName = invocation.getMethod().getName();
		Object[] arguments = invocation.getArguments();
		Class[] cs = new Class[arguments.length];
		for (int k = 0; k < arguments.length; k++) {
			cs[k] = arguments[k].getClass();
		}

		//-------------------------------------------- simple impl
		Object result = null;
		String cacheKey = getCacheKey(targetName, methodName, arguments);
		Element element = cache.get(cacheKey);
		if (element == null) {
			logger.debug("Hold up method , Get method result and create cache........!");
			result = invocation.proceed();
			element = new Element(cacheKey, (Serializable) result);
			cache.put(element);
		}
		return element.getValue();
		
		//-------------------------------------------- other difficult impl
		/**
		if (invocation.getThis().getClass().getCanonicalName().contains("$Proxy")) {
			if (logger.isWarnEnabled()) {
				logger.warn("----- The object has been proxyed and method " +
						"cache interceptor can't get the target, " +
						"so the method result can't be cached which name is ------" + methodName);
			}
			return invocation.proceed();
		} else {
			if (invocation.getThis().getClass().isAnnotationPresent(ObjectCache.class)) {
				ObjectCache oc = invocation.getThis().getClass().getAnnotation(ObjectCache.class);
				return getResult(targetName, methodName, arguments, invocation, oc.expire());
			} else {
				Method[] mss = invocation.getThis().getClass().getMethods();
				Method ms = null;
				for (Method m : mss) {
					if (m.getName().equals(methodName)) {
						boolean argMatch = true;
						Class[] tmpCs = m.getParameterTypes();
						if (tmpCs.length != cs.length) {
							argMatch = false;
							continue;
						}
						for (int k = 0; k < cs.length; k++) {
							if (!cs[k].equals(tmpCs[k])) {
								argMatch = false;
								break;
							}
						}
						
						if (argMatch) {
							ms = m;
							break;
						}
					}
				}
				
				if (ms != null && ms.isAnnotationPresent(MethodCache.class)) {
					MethodCache mc = ms.getAnnotation(MethodCache.class);
					return getResult(targetName, methodName, arguments, invocation, mc.expire());
				} else {
					return invocation.proceed();
				}
			}
		}
		*/
	}
	
	private Object getResult(String targetName, String methodName, Object[] arguments,
			MethodInvocation invocation, int expire) throws Throwable {
		Object result;
		
		String cacheKey = getCacheKey(targetName, methodName, arguments);
		Element element = cache.get(cacheKey);
		if (element == null) {
			synchronized (this) {
				element = cache.get(cacheKey);
					if (element == null) {
					result = invocation.proceed();
	
					element = new Element(cacheKey, (Serializable) result);
					
					//annotation没有设expire值则使用ehcache.xml中自定义值
					if (expire > 0) {
						element.setTimeToIdle(expire);
						element.setTimeToLive(expire);
					}
					cache.put(element);
				}
			}
		}
		
		return element.getValue();
	}

	/**
	 * 获得cache key的方法，cache key是Cache中一个Element的唯一标识
	 * cache key包括包名+类名+方法名
	 * @param targetName
	 * @param methodName
	 * @param arguments
	 * @return
	 */
	private String getCacheKey(String targetName, String methodName, Object[] arguments) {
	 	StringBuffer sb = new StringBuffer();
		sb.append(targetName).append(CACHENAME_SPLIT_CHAR).append(methodName);
		if ((arguments != null) && (arguments.length != 0)) {
			for (int i = 0; i < arguments.length; i++) {
				if (arguments[i] instanceof Date) {
					//sb.append(CACHENAME_SPLIT_CHAR).append(DateUtils.format((Date) arguments[i]));
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					sb.append(CACHENAME_SPLIT_CHAR).append(format.format((Date) arguments[i]));
				} else {
					sb.append(CACHENAME_SPLIT_CHAR).append(arguments[i]);
				}
			}
		}

		return sb.toString();
	}

}
