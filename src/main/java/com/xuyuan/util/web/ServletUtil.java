package com.xuyuan.util.web;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

public class ServletUtil {

	/**
	 * 直接response out
	 * @param data 字符串类型数据
	 * @param type 页面类型json,xml,text
	 * @throws Exception
	 */
	public static void render(String data,String type)  throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		if("json".equals(type)){
			response.setContentType("application/json;charset=utf-8");			
		}else if("xml".equals(type)){
			response.setContentType("text/xml;charset=utf-8");
		}else{
			response.setContentType("application/text;charset=utf-8");
		}
		response.setHeader("Cache-Control","no-cache");
		response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.write(data);
        out.flush();
        out.close();
	}
	public static void renderJSON(String data)  throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json;charset=utf-8");			
		response.setHeader("Cache-Control","no-cache");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write(data);
		out.flush();
		out.close();
	}
	public static void renderXML(String data)  throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/xml;charset=utf-8");
		response.setHeader("Cache-Control","no-cache");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write(data);
		out.flush();
		out.close();
	}
	public static void renderTEXT(String data)  throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/text;charset=utf-8");
		response.setHeader("Cache-Control","no-cache");
		response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.write(data);
        out.flush();
        out.close();
	}
}
