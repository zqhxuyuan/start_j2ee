package com.xuyuan.spring3.recipes.ws;

import java.util.Date;
import java.util.List;

import com.xuyuan.spring3.recipes.ws.rmi.TemperatureInfo;

public interface WeatherService { 
	 
	public String hello();
    public List<TemperatureInfo> getTemperatures(String city, List<Date> dates); 
}