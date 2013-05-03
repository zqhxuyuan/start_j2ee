package com.xuyuan.spring3.recipes.intergratweb.filter;

import java.util.Map;

public class CityServiceRequestAuditor {

	public void log(Map<String, String> attributes) { 
        for (String k : attributes.keySet()) { 
            System.out.println(String.format("%s=%s", k, attributes.get(k))); 
        } 
    }
}
