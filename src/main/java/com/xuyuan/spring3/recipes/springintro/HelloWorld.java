package com.xuyuan.spring3.recipes.springintro;

import java.util.List;

public class HelloWorld {

    /**
	 * @uml.property  name="message"
	 */
    private String message;
    /**
	 * @uml.property  name="holidays"
	 */
    private List<Holiday> holidays;

    /**
	 * @param message
	 * @uml.property  name="message"
	 */
    public void setMessage(String message) {
        this.message = message;
    }

    public void setHolidays(List<Holiday> holidays) {
        this.holidays = holidays;
    }

    public void hello() {
        System.out.println("Hello! " + message);
        for(Holiday d : holidays){
        	System.out.println("  " + d.getDay() + "/" + d.getMonth() + " " + d.getGreeting());
        }
    }
}
