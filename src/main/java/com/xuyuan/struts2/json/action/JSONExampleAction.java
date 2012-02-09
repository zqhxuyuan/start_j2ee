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

/**
this demo demonstrate struts-json-plugin usage.....
1.localhost:8080/start_j2ee/json/jsonExample1.action
DEBUG org.apache.struts2.json.JSONUtil.debug:68 - [JSON]... JSON example output
{
	"ints":[10,20],
	"newCustomName":"custom",
	"field1":"field1",
	"field2":"field2",
	"date":"2011-12-09T11:14:25",
	"userList":[
		{"description":"desc_0","id":"id_0","password":"password_0","username":"username_0"},
		{"description":"desc_1","id":"id_1","password":"password_1","username":"username_1"}
	],
	"userMap":{
		"id_1":{"description":"desc_1","id":"id_1","password":"password_1","username":"username_1"},
		"id_0":{"description":"desc_0","id":"id_0","password":"password_0","username":"username_0"}
	}
}

2.
http://localhost:8080/start_j2ee/json/getMyUserList.action
http://localhost:8080/start_j2ee/json/jsontest.jsp 点击链接getMyUserList 
[object Object][object Object][object Object]
[
	{"description":"desc_0","id":"id_0","password":"password_0","username":"username_0"},
	{"description":"desc_1","id":"id_1","password":"password_1","username":"username_1"},
	{"description":"desc_2","id":"id_2","password":"password_2","username":"username_2"}
]

http://localhost:8080/start_j2ee/json/getMyUserMap.action
http://localhost:8080/start_j2ee/json/jsontest.jsp 点击链接getMyUserMap 
[object Object]
{
	"id_2":{"description":"desc_2","id":"id_2","password":"password_2","username":"username_2"},
	"id_1":{"description":"desc_1","id":"id_1","password":"password_1","username":"username_1"},
	"id_0":{"description":"desc_0","id":"id_0","password":"password_0","username":"username_0"}
}

3.localhost:8080/start_j2ee/json/jsonExample1.action
此时再次访问该URL,会发现多了"myUserList":"success","myUserMap":"success"
而且userList和userMap中也多了一些数据.
如果注释掉struts.xml中的<param name="root">userList</param>,
访问json/getMyUserMap.action也有意想不到的惊喜..
*/
public class JSONExampleAction {
	
	private int[] ints = {10, 20};
	private String customName = "custom";
	private String field1 = "field1";
	private transient String field2 = "field2"; //'transient' fields are not serialized
	private String field3;				//fields without getter method are not serialized
	private Date date = Calendar.getInstance().getTime();
	
	private List<User> userList = new ArrayList<User>();
	private Map<String, User> userMap = new HashMap<String, User>();
	
	public String execute() {
		for (int i = 0; i < 2; i++) {
			User user = new User("id_" + i, "username_" + i, "password_" + i, "desc_" + i);
			userList.add(user);
			userMap.put(user.getId(), user);
		}
		return Action.SUCCESS;
	}
	
	public String getMyUserList() {  
        for (int i = 0; i < 3; i++) {  
            User user = new User("id_" + i, "username_" + i, "password_" + i, "desc_" + i);  
            userList.add(user);  
        }  
        return Action.SUCCESS;  
    }
	
    public String getMyUserMap() {  
        for (int i = 0; i < 3; i++) {  
            User user = new User("id_" + i, "username_" + i, "password_" + i, "desc_" + i);  
            userMap.put(user.getId(), user);  
        }  
        return Action.SUCCESS;  
    }  

	public int[] getInts() {
		return ints;
	}
	public void setInts(int[] ints) {
		this.ints = ints;
	}
	public List<User> getUserList() {
		return userList;
	}
	public void setUserList(List<User> userList) {
		this.userList = userList;
	}
	public Map<String, User> getUserMap() {
		return userMap;
	}
	public void setUserMap(Map<String, User> userMap) {
		this.userMap = userMap;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	public String getField1() {
		return field1;
	}
	public void setField1(String field1) {
		this.field1 = field1;
	}
	public String getField2() {
		return field2;
	}
	public void setField2(String field2) {
		this.field2 = field2;
	}
	
	@JSON(name = "newCustomName")
	public String getCustomName() {
		return this.customName;
	}
}
