package com.xuyuan.struts2.json.action;

import net.sf.json.JSONObject;

import com.google.gson.Gson;
import com.opensymphony.xwork2.Action;
import com.xuyuan.struts2.json.model.User;
import com.xuyuan.util.json.JSONUtil;
import com.xuyuan.util.web.ServletUtil;

public class Struts2JSONTestAction {

	/**
	 * @uml.property  name="user"
	 * @uml.associationEnd  
	 */
	private User user;
	/**
	 * @uml.property  name="jsonString"
	 */
	private String jsonString;
	/**
	 * @uml.property  name="result"
	 * @uml.associationEnd  qualifier="key:java.lang.Object java.lang.Object"
	 */
	private JSONObject result;
	
	public String jsonTest1() throws Exception{
		this.initUser();
		String data = JSONUtil.beanToJson(user);
		ServletUtil.render(data,"json");
		return null;
	}
	
	public String jsonTest2() throws Exception {
		this.initUser();
		Gson gson  = new Gson();
		jsonString = gson.toJson(user);
		return Action.SUCCESS;
	}
	
	public String jsonTest3(){
		this.initUser();
		result = JSONObject.fromObject(user);
		return "json";
	}
	
	public String jsonTest4(){
		this.initUser();
		jsonString = JSONUtil.beanToJson(user);
		return "json2";
	}
	
	private void initUser(){
		user = new User();
		user.setId(10000);
		user.setUsername("zhangsan");
		user.setPassword("000000");
	}
	
	/**
	 * @return
	 * @uml.property  name="user"
	 */
	public User getUser() {
		return user;
	}
	/**
	 * @param user
	 * @uml.property  name="user"
	 */
	public void setUser(User user) {
		this.user = user;
	}

	/**
	 * @return
	 * @uml.property  name="jsonString"
	 */
	public String getJsonString() {
		return jsonString;
	}
	/**
	 * @param jsonString
	 * @uml.property  name="jsonString"
	 */
	public void setJsonString(String jsonString) {
		this.jsonString = jsonString;
	}

	/**
	 * @return
	 * @uml.property  name="result"
	 */
	public JSONObject getResult() {
		return result;
	}
	/**
	 * @param result
	 * @uml.property  name="result"
	 */
	public void setResult(JSONObject result) {
		this.result = result;
	}
}

