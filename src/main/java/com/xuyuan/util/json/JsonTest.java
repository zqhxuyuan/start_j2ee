package com.xuyuan.util.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.junit.Test;


public class JsonTest {

	//对象生成JSON：使用JSON-LIB API--> JSONObject, JSONArray
	//@Test
	public void testObject2JSON(){
		User user = new User(1, "test");
		User user2 = new User(2, "tes2");
		
		User[] users = new User[2];
		users[0] = user;
		users[1] = user2;
		
		List<User> userList = new ArrayList<User>();
		userList.add(user);
		userList.add(user2);
		
		Set<User> userSet = new HashSet<User>();
		userSet.add(user);
		userSet.add(user2);
		
		Map<String,User> map = new HashMap<String,User>();
		map.put("1", user);
		map.put("2", user2);
		
		System.out.println(JSONObject.fromObject(user));
		System.out.println(JSONArray.fromObject(user)); //不建议
		
		System.out.println(JSONArray.fromObject(userList));
		System.out.println(JSONArray.fromObject(userSet));
		System.out.println(JSONArray.fromObject(users));
		
		System.out.println(JSONObject.fromObject(map));
		System.out.println(JSONArray.fromObject(map)); //不建议
		
	}
	
	//对象生成JSON：手动构造JSON字符串->String
	//@Test
	public void testObjectToJSON(){
		User user = new User(1, "test");
		User user2 = new User(2, "tes2");
		
		User[] users = new User[2];
		users[0] = user;
		users[1] = user2;
		
		List<User> userList = new ArrayList<User>();
		userList.add(user);
		userList.add(user2);
		
		Set<User> userSet = new HashSet<User>();
		userSet.add(user);
		userSet.add(user2);
		
		Map<String,User> userMap = new HashMap<String,User>();
		userMap.put("1", user);
		userMap.put("2", user2);
		
		System.out.println(JSONUtil.objectToJson(user));
		System.out.println(JSONUtil.objectToJson(users));
		System.out.println(JSONUtil.objectToJson(userList));
		System.out.println(JSONUtil.objectToJson(userSet));
		System.out.println(JSONUtil.objectToJson(userMap));
	}
	
	//手动构建JSON：JSONObject,JSONArray
	@Test
	public void testBuildJSON(){
		User user = new User(1, "test");
		User user2 = new User(2, "tes2");
		
		List<User> userList = new ArrayList<User>();
		userList.add(user);
		userList.add(user2);
		
		//THIS IS MORE SIMPLE!!!DO NOT USER STRING OPERATE!!!
		JSONObject result = new JSONObject();  
        result.put("total",5);  
        result.put("rows", userList);
        System.out.println(result);
        
        JSONArray jsonArray = new JSONArray();
        jsonArray.addAll(userList);
        System.out.println(jsonArray);
	}
	
	//JSON转为Object
	//@Test
	public void testJSON2Object(){
		String json1 = "{\"id\":1,\"name\":\"test\"}";
		String json2 = "[{\"id\":1,\"name\":\"test\"},{\"id\":2,\"name\":\"tes2\"}]";
		String json3 = "{\"2\":{\"id\":2,\"name\":\"tes2\"},\"1\":{\"id\":1,\"name\":\"test\"}}";
		
		User user = (User)JSONUtil.json2Object(json1, User.class);
		System.out.println(user);
		
		List<User> userList = JSONUtil.json2List(json2, User.class);
		for(User u : userList){
			System.out.println(u);
		}
		
		Map<String,Object> map = JSONUtil.json2Map(json3);
		Set<String> iter = map.keySet();
		for (Iterator it = iter.iterator(); it.hasNext();) {
			String key = (String)it.next();
		}
	}
}
