package com.xuyuan.spring3.recipes.webflow.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

/**
 * 7-1. Managing a Simple UI Flow with Spring Web Flow
 *  http://localhost:8888/start_j2ee/flows/welcome
 */
public class LibraryServiceImpl implements LibraryService { 
	 
    public List<Date> getHolidays() { 
        List<Date> holidays = new ArrayList<Date>(); 
        holidays.add(new GregorianCalendar(2007, 11, 25).getTime()); 
        holidays.add(new GregorianCalendar(2008, 0, 1).getTime()); 
        return holidays; 
    } 
}