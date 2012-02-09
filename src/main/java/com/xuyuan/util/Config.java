package com.xuyuan.util;

import java.util.Properties;

public class Config {

	private static Properties prop = new Properties();

	static {
		try {
			prop.load(Config.class.getResourceAsStream("/application.properties"));
		} catch ( Exception e ) {
			e.printStackTrace();
		}
	}

	public static String INDEXPATH = prop.getProperty("indexpath");
}
