package com.xuyuan.spring3.recipes.mvc.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ExtensionInterceptor extends HandlerInterceptorAdapter { 
	 
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception { 
        // Report date is present in request 
        String reportName = null; 
        String reportDate = request.getQueryString().replace("date=","").replace("-","_"); 
        if(request.getServletPath().endsWith(".pdf")) { 
            reportName= "ReservationSummary_" + reportDate + ".pdf"; 
        } 
        if(request.getServletPath().endsWith(".xls")) { 
            reportName= "ReservationSummary_" + reportDate + ".xls"; 
        } 
        if (reportName != null) { 
            // Set "Content-Disposition" HTTP Header,so a user gets a pretty 'Save as' address 
            response.setHeader("Content-Disposition","attachment; filename="+reportName); 
        } 
    } 
}
