package com.xuyuan.spring3.recipes.ws.rmi;

import java.io.Serializable;
import java.util.Date;

public class TemperatureInfo implements Serializable { 
	 
    /**
	 * @uml.property  name="city"
	 */
    private String city; 
    /**
	 * @uml.property  name="date"
	 */
    private Date date; 
    /**
	 * @uml.property  name="min"
	 */
    private double min; 
    /**
	 * @uml.property  name="max"
	 */
    private double max; 
    /**
	 * @uml.property  name="average"
	 */
    private double average;

	public TemperatureInfo() {
	}
	public TemperatureInfo(String city, Date date, double min, double max, double average) {
		this.city = city;
		this.date = date;
		this.min = min;
		this.max = max;
		this.average = average;
	}
	/**
	 * @return
	 * @uml.property  name="city"
	 */
	public String getCity() {
		return city;
	}
	/**
	 * @param city
	 * @uml.property  name="city"
	 */
	public void setCity(String city) {
		this.city = city;
	}
	/**
	 * @return
	 * @uml.property  name="date"
	 */
	public Date getDate() {
		return date;
	}
	/**
	 * @param date
	 * @uml.property  name="date"
	 */
	public void setDate(Date date) {
		this.date = date;
	}
	/**
	 * @return
	 * @uml.property  name="min"
	 */
	public double getMin() {
		return min;
	}
	/**
	 * @param min
	 * @uml.property  name="min"
	 */
	public void setMin(double min) {
		this.min = min;
	}
	/**
	 * @return
	 * @uml.property  name="max"
	 */
	public double getMax() {
		return max;
	}
	/**
	 * @param max
	 * @uml.property  name="max"
	 */
	public void setMax(double max) {
		this.max = max;
	}
	/**
	 * @return
	 * @uml.property  name="average"
	 */
	public double getAverage() {
		return average;
	}
	/**
	 * @param average
	 * @uml.property  name="average"
	 */
	public void setAverage(double average) {
		this.average = average;
	}
	@Override
	public String toString() {
		return "TemperatureInfo [city=" + city + ", date=" + date + ", min="
				+ min + ", max=" + max + ", average=" + average + "]";
	} 
 
}
