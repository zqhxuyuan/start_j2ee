package com.xuyuan.spring3.recipes.intergratweb.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

/**
 * <servlet-class>com.xuyuan.spring3.recipes.intergratweb.servlet.DistanceServlet</servlet-class>
 * 
 * http://localhost:8888/start_j2ee/distance
 */
public class DistanceServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String srcCity = request.getParameter("srcCity");
		String destCity = request.getParameter("destCity");

		WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		CityService cityService = (CityService) context.getBean("cityService");
		double distance = cityService.findDistance(srcCity, destCity);
		request.setAttribute("distance", distance);
		forward(request, response);
	}

	private void forward(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("spring/distance.jsp");
		dispatcher.forward(request, response);
	}
}