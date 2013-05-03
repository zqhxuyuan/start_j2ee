package com.xuyuan.spring3.recipes.mvc.domain;

import java.util.Date;

public class PeriodicReservation {

	/**
	 * @uml.property  name="courtName"
	 */
	private String courtName; 
    /**
	 * @uml.property  name="fromDate"
	 */
    private Date fromDate; 
    /**
	 * @uml.property  name="toDate"
	 */
    private Date toDate; 
    /**
	 * @uml.property  name="period"
	 */
    private int period; 
    /**
	 * @uml.property  name="hour"
	 */
    private int hour; 
    /**
	 * @uml.property  name="player"
	 * @uml.associationEnd  
	 */
    private Player player;
    
	/**
	 * @return
	 * @uml.property  name="courtName"
	 */
	public String getCourtName() {
		return courtName;
	}
	/**
	 * @param courtName
	 * @uml.property  name="courtName"
	 */
	public void setCourtName(String courtName) {
		this.courtName = courtName;
	}
	/**
	 * @return
	 * @uml.property  name="fromDate"
	 */
	public Date getFromDate() {
		return fromDate;
	}
	/**
	 * @param fromDate
	 * @uml.property  name="fromDate"
	 */
	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}
	/**
	 * @return
	 * @uml.property  name="toDate"
	 */
	public Date getToDate() {
		return toDate;
	}
	/**
	 * @param toDate
	 * @uml.property  name="toDate"
	 */
	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}
	/**
	 * @return
	 * @uml.property  name="period"
	 */
	public int getPeriod() {
		return period;
	}
	/**
	 * @param period
	 * @uml.property  name="period"
	 */
	public void setPeriod(int period) {
		this.period = period;
	}
	/**
	 * @return
	 * @uml.property  name="hour"
	 */
	public int getHour() {
		return hour;
	}
	/**
	 * @param hour
	 * @uml.property  name="hour"
	 */
	public void setHour(int hour) {
		this.hour = hour;
	}
	/**
	 * @return
	 * @uml.property  name="player"
	 */
	public Player getPlayer() {
		return player;
	}
	/**
	 * @param player
	 * @uml.property  name="player"
	 */
	public void setPlayer(Player player) {
		this.player = player;
	}
    
}
