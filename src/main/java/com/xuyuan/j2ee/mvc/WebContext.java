package com.xuyuan.j2ee.mvc;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author ajun
 * @http://blog.csdn.net/ajun_studio  
 **/
public class WebContext {

	public static ThreadLocal<HttpServletRequest> requestHodler = new ThreadLocal<HttpServletRequest>();
   
	public HttpServletRequest getRequest(){
           return requestHodler.get();
    }
   
	public HttpSession getSession(){
           return requestHodler.get().getSession();
    }
   
	public ServletContext getServletContext(){
           return requestHodler.get().getSession().getServletContext();
    }
}
