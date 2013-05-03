package com.xuyuan.struts2.formtags.model;

public class State {
	/**
	 * @uml.property  name="stateAbbr"
	 */
	private String stateAbbr;
	/**
	 * @uml.property  name="stateName"
	 */
	private String stateName;

	public State (String stateAbbr, String stateName) {
		this.stateAbbr = stateAbbr;
		this.stateName = stateName;
	}

	/**
	 * @param stateAbbr
	 * @uml.property  name="stateAbbr"
	 */
	public void setStateAbbr(String stateAbbr) {
		this.stateAbbr = stateAbbr;
	}
	/**
	 * @return
	 * @uml.property  name="stateAbbr"
	 */
	public String getStateAbbr() {
		return stateAbbr;
	}

	/**
	 * @param stateName
	 * @uml.property  name="stateName"
	 */
	public void setStateName(String stateName) {
		this.stateName = stateName;
	}
	/**
	 * @return
	 * @uml.property  name="stateName"
	 */
	public String getStateName() {
		return stateName;
	}

	public String toString() {
		return getStateAbbr() ;
	}
}
