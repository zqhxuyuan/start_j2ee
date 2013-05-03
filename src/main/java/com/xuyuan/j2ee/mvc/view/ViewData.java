package com.xuyuan.j2ee.mvc.view;

import javax.servlet.http.HttpServletRequest;

import com.xuyuan.j2ee.mvc.WebContext;

/**
 * request范围的数据存储类
 * @author ajun
 * @http://blog.csdn.net/ajun_studio  
 **/
public class ViewData {
	
	/**
	 * @uml.property  name="request"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
	private HttpServletRequest request;
	
	public ViewData() {
		initRequestAndResponse();
	}

	private void initRequestAndResponse(){
		this.request = WebContext.requestHodler.get();//下面会介绍
	}
	
	public void put(String name,Object value){
		// 将数据设置到request范围内
		this.request.setAttribute(name, value);
	}
	
}
