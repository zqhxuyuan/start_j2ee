package com.xuyuan.hibernate3.refdoc;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity 
@Table(name="colors") 
public class Color {

	/**
	 * @uml.property  name="id"
	 */
	private Long id;
	/**
	 * @uml.property  name="value"
	 */
	private String value;
	
	public Color(){}
	
	public Color(String value) {
		super();
		this.value = value;
	}
	/**
	 * @return
	 * @uml.property  name="id"
	 */
	@Id 
	@GeneratedValue
	public Long getId() {
		return id;
	}
	/**
	 * @param id
	 * @uml.property  name="id"
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * @return
	 * @uml.property  name="value"
	 */
	public String getValue() {
		return value;
	}
	/**
	 * @param value
	 * @uml.property  name="value"
	 */
	public void setValue(String value) {
		this.value = value;
	}
	
}
