package com.xuyuan.spring3.recipes.mvc.web;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.xuyuan.spring3.recipes.mvc.domain.Player;
import com.xuyuan.spring3.recipes.mvc.domain.Reservation;
import com.xuyuan.spring3.recipes.mvc.domain.ReservationList;
import com.xuyuan.spring3.recipes.mvc.domain.ReservationValidator;
import com.xuyuan.spring3.recipes.mvc.domain.SportType;
import com.xuyuan.spring3.recipes.mvc.service.ReservationService;
 
@Controller 
@RequestMapping("/reservation") 
@SessionAttributes("reservation")
public class ReservationController { 
 
    /**
	 * @uml.property  name="reservationService"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
    private ReservationService reservationService; 
    /**
	 * @uml.property  name="reservationValidator"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
    private ReservationValidator reservationValidator;
    
    @Autowired 
    public ReservationController(ReservationService reservationService, ReservationValidator reservationValidator) {
		this.reservationService = reservationService;
		this.reservationValidator = reservationValidator; 
	}
    
    @RequestMapping(value = "/list", method = RequestMethod.GET) 
    public String list(Model model) {
    	List<Reservation> reservations = reservationService.list();
    	model.addAttribute("reservations", reservations); 
    	return "reservation"; //==>reservation.jsp
    } 

    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String query(@RequestParam("courtName") String courtName, Model model) { 
        List<Reservation> reservations = Collections.emptyList(); 
        if (courtName != null) { 
            reservations = reservationService.query(courtName); 
        } 
        model.addAttribute("reservations", reservations); 
        return "reservation"; 
    } 
    
    @RequestMapping(value = "/add", method = RequestMethod.GET) 
    public String add(@RequestParam(required = false, value = "username") String username, Model model) { 
    	Reservation reservation = new Reservation();
    	//Initializing a model attribute object and pre-populating a form with values
    	reservation.setPlayer(new Player(username, null)); 
    	
        model.addAttribute("reservation", reservation);  //modelAttribute="reservation"
        return "reservationForm"; //==>reservationForm.jsp
    }
    
    @RequestMapping(value = "/save", method = RequestMethod.POST) 
    public String save(@ModelAttribute("reservation") Reservation reservation , BindingResult result, ModelMap model, SessionStatus status) {
    	//reservationService.save(reservation); 
        //return "redirect:list";  		//√ 防止表单重复提交
        //return "reservation"; 		//× 不要转向到JSP页面，刷新页面时，会重复提交数据 
    	
    	// Validating Form Data
    	reservationValidator.validate(reservation, result); 
    	if (result.hasErrors()) { 
            model.addAttribute("reservation", reservation); 
            return "reservationForm"; 
        } else { 
            reservationService.save(reservation);
            // Expiring a controller’s Session Data
            status.setComplete();
            //return "redirect:list"; 
            return "redirect:list.html"; 
        }
    }
    
    //Providing form Reference Data
    @ModelAttribute("sportTypes") 
    public List<SportType> populateSportTypes() { 
        return reservationService.getAllSportTypes(); 
    }
 
    // 8-13. Creating Excel and PDF Views
    @RequestMapping(value = "/summary", method = RequestMethod.GET) 
    public String generateSummary(@RequestParam(required = true, value = "date") String selectedDate, Model model) {  
	    List<Reservation> reservations = Collections.emptyList(); 
	    try {  
	        Date summaryDate = new SimpleDateFormat("yyyy-MM-dd").parse(selectedDate); 
	        reservations = reservationService.findByDate(summaryDate); 
	    } catch (java.text.ParseException ex) {  
	        StringWriter sw = new StringWriter(); 
	        PrintWriter pw = new PrintWriter(sw); 
	        ex.printStackTrace(pw); 
	    } 
	    //model.addAttribute("reservations",reservations); //Unable to locate object to be marshalled in model
	    ReservationList list = new ReservationList("reservations",reservations);
	    model.addAttribute("reservations",list.getList()); 
	    return "reservationSummary"; 
	}
}
