package com.xuyuan.struts2.json.action;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.Action;
import com.xuyuan.struts2.json.model.User;

public class Struts2JSONPluginTestAction {
	
	/**
	 * @uml.property  name="ints" multiplicity="(0 -1)" dimension="1"
	 */
	private int[] ints = {10, 20};
	/**
	 * @uml.property  name="field1"
	 */
	private String field1 = "field1";
	/**
	 * @uml.property  name="date"
	 */
	private Date date = Calendar.getInstance().getTime();
	/**
	 * @uml.property  name="message"
	 */
	private String message; 						
	
	/**
	 * @uml.property  name="userInfo"
	 * @uml.associationEnd  
	 */
	private User userInfo; 							
	/**
	 * @uml.property  name="userList"
	 * @uml.associationEnd  multiplicity="(0 -1)" elementType="com.xuyuan.struts2.json.model.User"
	 */
	private List<User> userList = new ArrayList<User>();
	/**
	 * @uml.property  name="userMap"
	 * @uml.associationEnd  qualifier="getId:java.lang.Integer com.xuyuan.struts2.json.model.User"
	 */
	private Map<Integer, User> userMap = new HashMap<Integer, User>();

	/**
	 * @uml.property  name="customName"
	 */
	private String customName = "custom";			//使用注解@JSON,会被序列化
	/**
	 * @uml.property  name="field2"
	 */
	private transient String field2 = "field2"; 	//'transient' fields are not serialized
	/**
	 * @uml.property  name="field3"
	 */
	private String field3;							//fields without getter method are not serialized
	
	//所有get方法  http://localhost:8888/start_j2ee/jsonPluginTest.action
	public String execute() {
		for (int i = 0; i < 2; i++) {
			User user = new User(i, "username_" + i, "password_" + i, "desc_" + i);
			userList.add(user);
			userMap.put(user.getId(), user);
		}
		return Action.SUCCESS;
	}
	
	//返回单个值  http://localhost:8888/start_j2ee/jsonPluginTest!returnMessage.action
	public String returnMessage() {
		this.message = "成功返回单个值";
		return "success";
	}

	//返回UserInfo对象  http://localhost:8888/start_j2ee/jsonPluginTest!returnUserInfo.action
	public String returnUserInfo() {
		userInfo = new User();
		userInfo.setId(10000);
		userInfo.setUsername("张三");
		userInfo.setPassword("000000");
		return "success";
	}
	
	// http://localhost:8888/start_j2ee/jsonPluginTest!returnList.action		包含Action里的所有属性
	// http://localhost:8888/start_j2ee/returnList.action	根对象root是userList，不包含Action里的其他属性
	public String returnList() {  
        for (int i = 0; i < 3; i++) {  
            User user = new User(i, "username_" + i, "password_" + i, "desc_" + i);  
            userList.add(user);  
        }  
        return Action.SUCCESS;  
    }
	
	// http://localhost:8888/start_j2ee/jsonPluginTest!returnMap.action			包含Action里的所有属性
	// http://localhost:8888/start_j2ee/returnMap.action	根对象root是userMap，不包含Action里的其他属性
    public String returnMap() {  
        for (int i = 0; i < 3; i++) {  
            User user = new User(i, "username_" + i, "password_" + i, "desc_" + i);  
            userMap.put(user.getId(), user);  
        }  
        return Action.SUCCESS;  
    }  
    
    /**
     * 页面表单提交到该方法，表单的name域userInfo.XXX会自动设置到User对象的各个属性里（此处是struts2的特性，和json无关）。
     * 接下来可以将数据入库或者回显数据：
     * 
     * 回显填写的数据：
     * 1.返回SUCCESS，struts.xml中result type="json"，会被struts-json-plugin转换为JSON数据
     * 2.在回调函数里，可以得到User对象的JSON字符串，即显示用户填写的信息。
     * 
     * 数据入库：
     * 1.不需要设置result type="json"
     * 2.回调函数也不是必须的。
     * @return
     */
    public String gainUserInfo(){
    	//System.out.println("ID  :" + userInfo.getId());
    	System.out.println("NAME:" + userInfo.getUsername());
    	System.out.println("PASS:" + userInfo.getPassword());
    	// save data into db..
    	return Action.SUCCESS;
    }

	/**
	 * @return
	 * @uml.property  name="ints"
	 */
	public int[] getInts() {
		return ints;
	}
	/**
	 * @param ints
	 * @uml.property  name="ints"
	 */
	public void setInts(int[] ints) {
		this.ints = ints;
	}
	/**
	 * @return
	 * @uml.property  name="date"
	 */
	public Date getDate() {
		return date;
	}
	/**
	 * @param date
	 * @uml.property  name="date"
	 */
	public void setDate(Date date) {
		this.date = date;
	}
	/**
	 * @return
	 * @uml.property  name="field1"
	 */
	public String getField1() {
		return field1;
	}
	/**
	 * @param field1
	 * @uml.property  name="field1"
	 */
	public void setField1(String field1) {
		this.field1 = field1;
	}
	/**
	 * @return
	 * @uml.property  name="field2"
	 */
	public String getField2() {
		return field2;
	}
	/**
	 * @param field2
	 * @uml.property  name="field2"
	 */
	public void setField2(String field2) {
		this.field2 = field2;
	}
	/**
	 * @return
	 * @uml.property  name="message"
	 */
	public String getMessage() {
		return message;
	}
	/**
	 * @param message
	 * @uml.property  name="message"
	 */
	public void setMessage(String message) {
		this.message = message;
	}
	
	/**
	 * @return
	 * @uml.property  name="userInfo"
	 */
	public User getUserInfo() {
		return userInfo;
	}
	/**
	 * @param userInfo
	 * @uml.property  name="userInfo"
	 */
	public void setUserInfo(User userInfo) {
		this.userInfo = userInfo;
	}
	public List<User> getUserList() {
		return userList;
	}
	public void setUserList(List<User> userList) {
		this.userList = userList;
	}
	public Map<Integer, User> getUserMap() {
		return userMap;
	}
	public void setUserMap(Map<Integer, User> userMap) {
		this.userMap = userMap;
	}
	
	/**
	 * @return
	 * @uml.property  name="customName"
	 */
	@JSON(name = "newCustomName")
	public String getCustomName() {
		return this.customName;
	}
}
