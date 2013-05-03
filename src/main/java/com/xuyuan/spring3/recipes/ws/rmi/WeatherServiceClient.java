package com.xuyuan.spring3.recipes.ws.rmi;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import com.xuyuan.spring3.recipes.ws.WeatherService;

public class WeatherServiceClient {

	/**
	 * @uml.property  name="weatherService"
	 * @uml.associationEnd  
	 */
	private WeatherService weatherService; 
	 
    /**
	 * @param weatherService
	 * @uml.property  name="weatherService"
	 */
    public void setWeatherService(WeatherService weatherService) { 
        this.weatherService = weatherService; 
    } 
 
    public TemperatureInfo getTodayTemperature(String city) { 
        List<Date> dates = Arrays.asList(new Date[] { new Date() }); 
        List<TemperatureInfo> temperatures = weatherService.getTemperatures(city, dates); 
        return temperatures.get(0); 
    } 
}
