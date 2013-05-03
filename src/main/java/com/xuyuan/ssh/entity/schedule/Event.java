package com.xuyuan.ssh.entity.schedule;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

@Entity
@Table(name = "t_event")
public class Event implements Serializable{

	/**
	 * @uml.property  name="eventId"
	 */
	private String eventId;
	/**
	 * @uml.property  name="startDate"
	 */
	private Date startDate;
	/**
	 * @uml.property  name="endDate"
	 */
	private Date endDate;
	/**
	 * @uml.property  name="text"
	 */
	private String text;
	/**
	 * @uml.property  name="details"
	 */
	private String details;
	
	/**
	 * @return
	 * @uml.property  name="eventId"
	 */
	@Id
	@TableGenerator(name="tab_stone",table="generator_table",pkColumnName = "g_key",valueColumnName = "g_value",pkColumnValue="schedule_event_pk",allocationSize=1)
	@GeneratedValue(strategy = GenerationType.TABLE,generator="tab_stone")
	public String getEventId() {
		return eventId;
	}
	/**
	 * @param eventId
	 * @uml.property  name="eventId"
	 */
	public void setEventId(String eventId) {
		this.eventId = eventId;
	}

	/**
	 * @return
	 * @uml.property  name="startDate"
	 */
	@Column(name = "startDate")
	public Date getStartDate() {
		return startDate;
	}
	/**
	 * @param startDate
	 * @uml.property  name="startDate"
	 */
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	/**
	 * @return
	 * @uml.property  name="endDate"
	 */
	@Column(name = "endDate")
	public Date getEndDate() {
		return endDate;
	}
	/**
	 * @param endDate
	 * @uml.property  name="endDate"
	 */
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	/**
	 * @return
	 * @uml.property  name="text"
	 */
	public String getText() {
		return text;
	}
	/**
	 * @param text
	 * @uml.property  name="text"
	 */
	public void setText(String text) {
		this.text = text;
	}
	/**
	 * @return
	 * @uml.property  name="details"
	 */
	public String getDetails() {
		return details;
	}
	/**
	 * @param details
	 * @uml.property  name="details"
	 */
	public void setDetails(String details) {
		this.details = details;
	}
	
}
