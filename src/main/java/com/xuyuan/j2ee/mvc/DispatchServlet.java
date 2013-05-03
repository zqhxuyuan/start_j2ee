package com.xuyuan.j2ee.mvc;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xuyuan.j2ee.ioc.applicationContext.AnnotationClassPathApplicationContext;
import com.xuyuan.j2ee.ioc.factory.AnnotationBeanFactory;
import com.xuyuan.j2ee.ioc.factory.RequestMapingMap;
import com.xuyuan.j2ee.ioc.utils.BeanUtils;
import com.xuyuan.j2ee.mvc.annotation.RequestMapping;
import com.xuyuan.j2ee.mvc.constant.DispatchActionConstant;
import com.xuyuan.j2ee.mvc.view.View;

/**
 * @author ajun
 * @http://blog.csdn.net/ajun_studio  
 **/
public class DispatchServlet extends HttpServlet {
	private static final long serialVersionUID = 5325307163972641802L;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		// 初始化bean,以及依赖的bean注入。注意配置的扫描路径要包括dao,service,action
		AnnotationClassPathApplicationContext.getAnnotationClassPathApplicationContext().init();
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.excute(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.excute(request, response);
	}
	
	private void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		WebContext.requestHodler.set(request);//初始化当前请求的request
		String lasturl = pareRequestURI(request);//person/list,解析url
		String className = RequestMapingMap.getRequesetMap().get(lasturl); //根据方法上配置的path，获取该方法对应的类<-BeandefinitionList#Line74
		Object actionClass = AnnotationBeanFactory.getBeanFactory().getBean(className);
		Method [] methods = BeanUtils.findDeclaredMethods(actionClass.getClass());
		Method method = null;
		for(Method m:methods){//循环方法，找匹配的方法进行执行
			if(m.isAnnotationPresent(RequestMapping.class)){
				String anoPath = m.getAnnotation(RequestMapping.class).value();
				if(anoPath!=null && !"".equals(anoPath.trim()) && lasturl.equals(anoPath.trim())){
					method = m;
					break;
				}
			}
		}
		try {
			if(method!=null){
				View view = (View)method.invoke(actionClass, request,response);//执行action的方法
				if(view.getDispathAction().equals(DispatchActionConstant.FORWARD)){//不同的跳转方式
					request.getRequestDispatcher(view.getUrl()).forward(request, response);
				}else if(view.getDispathAction().equals(DispatchActionConstant.REDIRECT)){
					response.sendRedirect(view.getUrl());
				}else{
					request.getRequestDispatcher(view.getUrl()).forward(request, response);
				}
				
			}
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
	}
	
	private String pareRequestURI(HttpServletRequest request){
		String path = request.getContextPath()+"/";// /ajun
		String requestUri = request.getRequestURI();// ajun/person/list.ajun
		String midUrl = requestUri.replaceFirst(path, "");
		String lasturl = midUrl.substring(0, midUrl.lastIndexOf("."));//person/list
		return lasturl;
	}

}
