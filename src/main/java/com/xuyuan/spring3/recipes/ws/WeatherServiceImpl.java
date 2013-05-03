package com.xuyuan.spring3.recipes.ws;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.xuyuan.spring3.recipes.ws.rmi.TemperatureInfo;

public class WeatherServiceImpl implements WeatherService { 
	 
    public List<TemperatureInfo> getTemperatures(String city, List<Date> dates) { 
        List<TemperatureInfo> temperatures = new ArrayList<TemperatureInfo>(); 
        for (Date date : dates) { 
            temperatures.add(new TemperatureInfo(city, date, 5.0, 10.0, 8.0)); 
        } 
        return temperatures; 
    }

	public String hello() {
		System.out.println("-------------hello---------------");
		return "HelloWorld!!!";
	}
}
