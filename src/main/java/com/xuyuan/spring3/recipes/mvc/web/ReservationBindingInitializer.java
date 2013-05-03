package com.xuyuan.spring3.recipes.mvc.web;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.support.WebBindingInitializer;
import org.springframework.web.context.request.WebRequest;

import com.xuyuan.spring3.recipes.mvc.domain.SportType;
import com.xuyuan.spring3.recipes.mvc.domain.SportTypeEditor;
import com.xuyuan.spring3.recipes.mvc.service.ReservationService;
 
/**
 * Binding Properties of Custom Types
When a form is submitted, a controller binds the form field values to model object’s properties of the same name(a  Reservation object), 
However, for properties of custom types, a controller is not able to convert them unless you specify the corresponding property editors for them.  
For example, the sport type selection field only submits the selected sport type ID—as this is the way HTML <select>  fields operate. 
Therefore, you  have to convert this ID into a SportType object with a property editor. 
 *
 */
public class ReservationBindingInitializer implements WebBindingInitializer { 
 
    /**
	 * @uml.property  name="reservationService"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
    private ReservationService reservationService; 
 
    @Autowired 
    public ReservationBindingInitializer(ReservationService reservationService) { 
        this.reservationService = reservationService; 
    } 
 
    public void initBinder(WebDataBinder binder, WebRequest request) { 
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
        dateFormat.setLenient(false); 
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
        binder.registerCustomEditor(SportType.class, new SportTypeEditor(reservationService)); 
    } 
}