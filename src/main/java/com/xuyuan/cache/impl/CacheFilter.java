package com.xuyuan.cache.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.ResourceBundle;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * http://ahuaxuan.iteye.com/blog/348671
 * 在只使用tomcat的情况下,自动缓存js和css或者image等文件
 * 1.写一个filter,可以根据路径的正则来判断该路径的请求是否需要设置max-age
 * 2.在classpath路径下创建一个cache-pattern.properties文件
 * 在这个配置文件中,您可以根据js和css的路径来配置哪些目录,或者哪些文件需要设置max-age
 * 3.web.xml配置该Filter
 * @author ahuaxuan
 * @date 2008-12-4
 * @version $id$
 */
public class CacheFilter implements Filter{

	private static transient Log logger = LogFactory.getLog(CacheFilter.class);
	
	/**
	 * @uml.property  name="cacheTime"
	 */
	private Integer cacheTime = 3600 * 24;
	/**
	 * @uml.property  name="patternList"
	 * @uml.associationEnd  multiplicity="(0 -1)" elementType="java.util.regex.Pattern"
	 */
	private List<Pattern> patternList = new ArrayList<Pattern>();
	
	private static ResourceBundle rb = ResourceBundle.getBundle("cache-pattern");
	public void destroy() {
		
	}

	public void doFilter(ServletRequest rq, ServletResponse rqs, FilterChain fc) throws IOException, ServletException {
		fc.doFilter(rq, rqs);
		if (rq instanceof HttpServletRequest && rqs instanceof HttpServletResponse) {
			HttpServletRequest request = (HttpServletRequest) rq;
			HttpServletResponse response = (HttpServletResponse) rqs;
			
			if (matchPattern(request.getRequestURI())) {
				response.setHeader("Cache-Control", "max-age=" + cacheTime);
				if (logger.isDebugEnabled()) {
					StringBuilder sb = new StringBuilder();
					sb.append(" set cache control for uri = ").append(request.getRequestURI());
					sb.append(" and the cache time is ").append(cacheTime).append(" second");
					logger.debug(sb.toString());
				}
			}
		} 
		
	}

	public void init(FilterConfig arg0) throws ServletException {
		Enumeration<String> keys = rb.getKeys();
		while (keys.hasMoreElements()) {
			String p = keys.nextElement();
			String value = rb.getString(p);
			patternList.add(Pattern.compile(value, Pattern.CASE_INSENSITIVE));
			
			if (logger.isInfoEnabled()) {
				logger.info(">>>>>>>>>>> init the cache pattern " + value);
			}
		}
		
		if (arg0 != null) {
			String ct = arg0.getInitParameter("cache-time");
			if (!"".equals(ct) && null != ct) {
				cacheTime = new Integer(ct);
				if (logger.isInfoEnabled()) {
					logger.info(">>>>>>>>>> the cache time is " + cacheTime);
				}
			}
		}
	}
	
	private boolean matchPattern(String url) {
		for (Pattern pattern : patternList) {
			if (pattern.matcher(url).matches()) {
				return true;
			}
		}
		
		return false;
	}

	public static void main(String [] args) throws ServletException {
		CacheFilter cf = new CacheFilter();
		cf.init(null);
		System.out.println(cf.matchPattern("/css/table.CSS"));
	}
}


