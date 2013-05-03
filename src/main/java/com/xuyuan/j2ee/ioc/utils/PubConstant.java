package com.xuyuan.j2ee.ioc.utils;

import java.io.IOException;
import java.util.Properties;

/**
 * 读取constant.properties文件
 * @author ajun
 * @http://blog.csdn.net/ajun_studio  
 **/
public class PubConstant {

	private static Properties properties= new Properties();
	
	static{
		try {
			properties.load(PubConstant.class.getClassLoader().getResourceAsStream("application.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String getValue(String key){
		String value = (String)properties.get(key);
		return value.trim();
	}
}
