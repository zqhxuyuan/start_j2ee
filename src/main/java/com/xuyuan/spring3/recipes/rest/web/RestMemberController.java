package com.xuyuan.spring3.recipes.rest.web;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xuyuan.spring3.recipes.mvc.domain.Member;

@Controller 
public class RestMemberController { 
 
	// http://localhost:8888/start_j2ee/members.xml
    @RequestMapping("/members") 
    public String getRestMembers(Model model) { 
        Member member = new Member(); 
        member.setName("John Doe"); 
        member.setPhone("1-800-800-800"); 
        member.setEmail("john@doe.com"); 
        model.addAttribute("member", member); 
        return "membertemplate"; // Return view membertemplate. Via resolver the view will be mapped to a JAXB Marshler bound to the Member class 
    }
    
    @RequestMapping("/member/{memberid}") 
    public void getMember(@PathVariable("memberid") long memberID) {
    	
    }
    
    @InitBinder 
    public void initBinder(WebDataBinder binder) { 
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false)); 
    } 
    @RequestMapping("/reservations/{date}") 
        public void getReservation(@PathVariable("date") Date resDate) { 
    }
}
