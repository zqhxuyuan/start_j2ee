package com.xuyuan.spring3.recipes.mvc.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.util.WebUtils;

import com.xuyuan.spring3.recipes.mvc.domain.PeriodicReservation;
import com.xuyuan.spring3.recipes.mvc.domain.PeriodicReservationValidator;
import com.xuyuan.spring3.recipes.mvc.domain.Player;
import com.xuyuan.spring3.recipes.mvc.service.ReservationService;

@Controller 
@RequestMapping("/periodicReservationForm") 
@SessionAttributes("reservation")  
public class PeriodicReservationController { 
 
    /**
	 * @uml.property  name="reservationService"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
    private ReservationService reservationService; 
    /**
	 * @uml.property  name="validator"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
    private PeriodicReservationValidator validator;
 
    @Autowired 
    public PeriodicReservationController(ReservationService reservationService, PeriodicReservationValidator validator) { 
        this.reservationService = reservationService; 
        this.validator = validator;
    }
    
    @RequestMapping(method = RequestMethod.GET) 
    public String setupForm(Model model) {      
        PeriodicReservation reservation = new PeriodicReservation(); 
        reservation.setPlayer(new Player()); 
        model.addAttribute("reservation", reservation); 
        return "reservationCourtForm"; 
    }  
 
    @RequestMapping(method = RequestMethod.POST) 
    public String submitForm(HttpServletRequest request, HttpServletResponse response, 
            @ModelAttribute("reservation") PeriodicReservation reservation, BindingResult result, SessionStatus status, 
            @RequestParam("_page") int currentPage, Model model) {      
 
        Map pageForms = new HashMap(); 
        pageForms.put(0,"reservationCourtForm"); 
        pageForms.put(1,"reservationTimeForm"); 
        pageForms.put(2,"reservationPlayerForm"); 
        
        if (request.getParameter("_cancel") != null) { // Return to current page view, since user clicked cancel 
            return (String)pageForms.get(currentPage); 
        } else if (request.getParameter("_finish") != null) { // User is finished, make reservation 
        	validator.validate(reservation, result); 
            if (!result.hasErrors()) { 
            	reservationService.makePeriodic(reservation); 
            	status.setComplete(); 
            	//return "redirect:reservation/list"; 
            	return "redirect:reservation/list.html"; 
            } else {  
            	return (String)pageForms.get(currentPage); 
            } 
        } else {  
        	// User clicked Next or Previous(_target):Extract target page 
        	int targetPage = WebUtils.getTargetPage(request, "_target", currentPage); 
        	// If targetPage is lesser than current page, user clicked 'Previous' 
        	if (targetPage < currentPage) { 
                return (String)pageForms.get(targetPage); 
            }  
        	// User clicked 'Next', return target page 
        	switch (currentPage) { 
	            case 0: validator.validateCourt(reservation, result); break; 
	            case 1: validator.validateTime(reservation, result); break; 
	            case 2: validator.validatePlayer(reservation, result); break; 
	        } 
	        if (!result.hasErrors()) { 
	            // No errors, return target page 
	            return (String)pageForms.get(targetPage); 
	        } else {  
	            // Errors, return current page 
	            return (String)pageForms.get(currentPage); 
	        } 
        } 
	} 
 
    @ModelAttribute("periods") 
    public Map<Integer, String> periods() {     
        Map<Integer, String> periods = new HashMap<Integer, String>(); 
        periods.put(1, "Daily"); 
        periods.put(7, "Weekly"); 
        return periods; 
    } 
 
}
