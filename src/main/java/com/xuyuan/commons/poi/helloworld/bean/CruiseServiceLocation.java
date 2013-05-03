package com.xuyuan.commons.poi.helloworld.bean;

/**
 * 巡航服务地点bean
 *
 * @author Nanlei
 *
 */
public class CruiseServiceLocation {
	/**
	 * @uml.property  name="division"
	 */
	private String division;// 事业部
	/**
	 * @uml.property  name="province"
	 */
	private String province;// 省份
	/**
	 * @uml.property  name="dealerName"
	 */
	private String dealerName;// 经销商名称

	/**
	 * @uml.property  name="dealerCode"
	 */
	private String dealerCode;// 经销商代码
	/**
	 * @uml.property  name="location"
	 */
	private String location;// 巡航服务地点
	/**
	 * @uml.property  name="miles"
	 */
	private double miles;// 巡航服务里程
	/**
	 * @uml.property  name="locationNum"
	 */
	private int locationNum;// 地点条数

	/**
	 * @uml.property  name="totalDealer"
	 */
	private double totalDealer;// 经销商合计
	/**
	 * @uml.property  name="totalProvince"
	 */
	private double totalProvince;// 省份合计
	/**
	 * @uml.property  name="totalDivision"
	 */
	private double totalDivision;// 事业部合计

	public CruiseServiceLocation() {
		super();
	}

	public CruiseServiceLocation(String division, String province,
			String dealerName, String dealerCode, String location, double miles) {
		super();
		this.division = division;
		this.province = province;
		this.dealerName = dealerName;
		this.dealerCode = dealerCode;
		this.location = location;
		this.miles = miles;
	}

	/**
	 * @return
	 * @uml.property  name="division"
	 */
	public String getDivision() {
		return division;
	}

	/**
	 * @param division
	 * @uml.property  name="division"
	 */
	public void setDivision(String division) {
		this.division = division;
	}

	/**
	 * @return
	 * @uml.property  name="province"
	 */
	public String getProvince() {
		return province;
	}

	/**
	 * @param province
	 * @uml.property  name="province"
	 */
	public void setProvince(String province) {
		this.province = province;
	}

	/**
	 * @return
	 * @uml.property  name="dealerName"
	 */
	public String getDealerName() {
		return dealerName;
	}

	/**
	 * @param dealerName
	 * @uml.property  name="dealerName"
	 */
	public void setDealerName(String dealerName) {
		this.dealerName = dealerName;
	}

	/**
	 * @return
	 * @uml.property  name="dealerCode"
	 */
	public String getDealerCode() {
		return dealerCode;
	}

	/**
	 * @param dealerCode
	 * @uml.property  name="dealerCode"
	 */
	public void setDealerCode(String dealerCode) {
		this.dealerCode = dealerCode;
	}

	/**
	 * @return
	 * @uml.property  name="location"
	 */
	public String getLocation() {
		return location;
	}

	/**
	 * @param location
	 * @uml.property  name="location"
	 */
	public void setLocation(String location) {
		this.location = location;
	}

	/**
	 * @return
	 * @uml.property  name="miles"
	 */
	public double getMiles() {
		return miles;
	}

	/**
	 * @param miles
	 * @uml.property  name="miles"
	 */
	public void setMiles(double miles) {
		this.miles = miles;
	}

	/**
	 * @return
	 * @uml.property  name="locationNum"
	 */
	public int getLocationNum() {
		return locationNum;
	}

	/**
	 * @param locationNum
	 * @uml.property  name="locationNum"
	 */
	public void setLocationNum(int locationNum) {
		this.locationNum = locationNum;
	}

	/**
	 * @return
	 * @uml.property  name="totalDealer"
	 */
	public double getTotalDealer() {
		return totalDealer;
	}

	/**
	 * @param totalDealer
	 * @uml.property  name="totalDealer"
	 */
	public void setTotalDealer(double totalDealer) {
		this.totalDealer = totalDealer;
	}

	/**
	 * @return
	 * @uml.property  name="totalProvince"
	 */
	public double getTotalProvince() {
		return totalProvince;
	}

	/**
	 * @param totalProvince
	 * @uml.property  name="totalProvince"
	 */
	public void setTotalProvince(double totalProvince) {
		this.totalProvince = totalProvince;
	}

	/**
	 * @return
	 * @uml.property  name="totalDivision"
	 */
	public double getTotalDivision() {
		return totalDivision;
	}

	/**
	 * @param totalDivision
	 * @uml.property  name="totalDivision"
	 */
	public void setTotalDivision(double totalDivision) {
		this.totalDivision = totalDivision;
	}

	@Override
	public String toString() {
		return "CruiseServiceLocation [dealerCode=" + dealerCode
				+ ", dealerName=" + dealerName + ", division=" + division
				+ ", location=" + location + ", locationNum=" + locationNum
				+ ", miles=" + miles + ", province=" + province
				+ ", totalDealer=" + totalDealer + ", totalDivision="
				+ totalDivision + ", totalProvince=" + totalProvince + "]";
	}

}
