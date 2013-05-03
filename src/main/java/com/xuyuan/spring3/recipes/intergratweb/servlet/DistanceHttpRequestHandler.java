package com.xuyuan.spring3.recipes.intergratweb.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.HttpRequestHandler;

/**
 * <servlet-class>org.springframework.web.context.support.HttpRequestHandlerServlet</servlet-class>
 */
public class DistanceHttpRequestHandler implements HttpRequestHandler { 
	
    /**
	 * @uml.property  name="cityService"
	 * @uml.associationEnd  
	 */
    private CityService cityService; 
    /**
	 * @param cityService
	 * @uml.property  name="cityService"
	 */
    public void setCityService(final CityService cityService) { 
        this.cityService = cityService; 
    }
    
    @Override 
    public void handleRequest(final HttpServletRequest request, final HttpServletResponse response) 
        throws ServletException, IOException { 
        if (request.getMethod().toUpperCase().equals("POST")) { 
            String srcCity = request.getParameter("srcCity"); 
            String destCity = request.getParameter("destCity"); 
            double distance = cityService.findDistance(srcCity, destCity); 
            request.setAttribute("distance", distance); 
        } 
        forward(request, response); 
    } 
    private void forward(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException { 
        RequestDispatcher dispatcher = request.getRequestDispatcher("spring/distance.jsp"); 
        dispatcher.forward(request, response); 
    }
}
