package com.xuyuan.spring3.recipes.mvc.domain;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElements;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class ReservationList {

	/**
	 * @uml.property  name="name"
	 */
	private String name;
	/**
	 * @uml.property  name="list"
	 */
	private List<Reservation> list;
	
	public ReservationList(){}
    public ReservationList(String name, List<Reservation> list) {
    	this.name = name;
    	this.list = list;
	}

	@XmlElements({
        @XmlElement(name = "reservations", type = Reservation.class),
    })
    public List<Reservation> getList() {
        return list;
    }
 
    public void setList(List<Reservation> list) {
        this.list = list;
    }

	/**
	 * @return
	 * @uml.property  name="name"
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 * @uml.property  name="name"
	 */
	public void setName(String name) {
		this.name = name;
	}
}
