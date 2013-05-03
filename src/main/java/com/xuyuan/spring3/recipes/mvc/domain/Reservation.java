package com.xuyuan.spring3.recipes.mvc.domain;

import java.util.Date;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "reservation")
public class Reservation {

	/**
	 * @uml.property  name="courtName"
	 */
	private String courtName;
    /**
	 * @uml.property  name="date"
	 */
    private Date date;
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
	 * @uml.property  name="sportType"
	 * @uml.associationEnd  
	 */
    private SportType sportType;

    public Reservation() {}
	public Reservation(String courtName, Date date, int hour, Player player, SportType sportType) {
		super();
		this.courtName = courtName;
		this.date = date;
		this.hour = hour;
		this.player = player;
		this.sportType = sportType;
	}
	/**
	 * @return
	 * @uml.property  name="courtName"
	 */
	@XmlElement
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
	 * @uml.property  name="date"
	 */
	@XmlElement
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
	 * @uml.property  name="hour"
	 */
	@XmlElement
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
	@XmlElement
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
	/**
	 * @return
	 * @uml.property  name="sportType"
	 */
	@XmlElement
	public SportType getSportType() {
		return sportType;
	}
	/**
	 * @param sportType
	 * @uml.property  name="sportType"
	 */
	public void setSportType(SportType sportType) {
		this.sportType = sportType;
	}
    
    
}
