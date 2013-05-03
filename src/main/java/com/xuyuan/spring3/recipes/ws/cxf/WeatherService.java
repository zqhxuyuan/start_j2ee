package com.xuyuan.spring3.recipes.ws.cxf;

import java.util.Date;
import java.util.List;

import javax.jws.WebService;

import com.xuyuan.spring3.recipes.ws.rmi.TemperatureInfo;

/**
 * http://localhost:8888/start_j2ee/cxf/WeatherService3?wsdl
 */
@WebService
public interface WeatherService { 
	 
	public String hello();
    public List<TemperatureInfo> getTemperatures(String city, List<Date> dates); 
}