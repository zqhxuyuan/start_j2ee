package com.xuyuan.spring3.recipes.intergratweb.jsf;

import com.xuyuan.spring3.recipes.intergratweb.servlet.CityService;

/**
 * 6-4. Integrating Spring with JSF
 * The basic idea of JSF is to separate presentation  logic from UIs 
 * by encapsulating it in one or more JSF managed beans.
 * 
 * http://localhost:8888/start_j2ee/distance.faces
 */
public class DistanceBean {

	/**
	 * @uml.property  name="srcCity"
	 */
	private String srcCity; 
    /**
	 * @uml.property  name="destCity"
	 */
    private String destCity; 
    /**
	 * @uml.property  name="distance"
	 */
    private double distance; 
    
    /**
	 * @uml.property  name="cityService"
	 * @uml.associationEnd  
	 */
    private CityService cityService;
    
	/**
	 * @return
	 * @uml.property  name="srcCity"
	 */
	public String getSrcCity() {
		return srcCity;
	}
	/**
	 * @param srcCity
	 * @uml.property  name="srcCity"
	 */
	public void setSrcCity(String srcCity) {
		this.srcCity = srcCity;
	}
	/**
	 * @return
	 * @uml.property  name="destCity"
	 */
	public String getDestCity() {
		return destCity;
	}
	/**
	 * @param destCity
	 * @uml.property  name="destCity"
	 */
	public void setDestCity(String destCity) {
		this.destCity = destCity;
	}
	/**
	 * @return
	 * @uml.property  name="distance"
	 */
	public double getDistance() {
		return distance;
	}
//	public void setDistance(double distance) {
//		this.distance = distance;
//	}
//	public CityService getCityService() {
//		return cityService;
//	}
	/**
	 * @param cityService
	 * @uml.property  name="cityService"
	 */
	public void setCityService(CityService cityService) {
		this.cityService = cityService;
	}
	
	public void find() { 
        distance = cityService.findDistance(srcCity, destCity); 
    } 
    
}
