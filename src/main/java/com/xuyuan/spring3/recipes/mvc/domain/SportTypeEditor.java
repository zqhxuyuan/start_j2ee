package com.xuyuan.spring3.recipes.mvc.domain;

import java.beans.PropertyEditorSupport;

import com.xuyuan.spring3.recipes.mvc.service.ReservationService;

public class SportTypeEditor extends PropertyEditorSupport{

	/**
	 * @uml.property  name="reservationService"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
	private ReservationService reservationService; 
	 
    public SportTypeEditor(ReservationService reservationService) { 
        this.reservationService = reservationService; 
    } 
 
    public void setAsText(String text) throws IllegalArgumentException { 
        int sportTypeId = Integer.parseInt(text); 
        SportType sportType = reservationService.getSportType(sportTypeId); 
        setValue(sportType); 
    }
}
