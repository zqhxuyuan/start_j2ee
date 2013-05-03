package com.xuyuan.spring3.recipes.springintro;

public class Holiday {

    /**
	 * @uml.property  name="month"
	 */
    private int month;
    /**
	 * @uml.property  name="day"
	 */
    private int day;
    /**
	 * @uml.property  name="greeting"
	 */
    private String greeting;

    /**
	 * @return
	 * @uml.property  name="month"
	 */
    public int getMonth() {
        return month;
    }

    /**
	 * @param month
	 * @uml.property  name="month"
	 */
    public void setMonth(int month) {
        this.month = month;
    }

    /**
	 * @return
	 * @uml.property  name="day"
	 */
    public int getDay() {
        return day;
    }

    /**
	 * @param day
	 * @uml.property  name="day"
	 */
    public void setDay(int day) {
        this.day = day;
    }

    /**
	 * @return
	 * @uml.property  name="greeting"
	 */
    public String getGreeting() {
        return greeting;
    }

    /**
	 * @param greeting
	 * @uml.property  name="greeting"
	 */
    public void setGreeting(String greeting) {
        this.greeting = greeting;
    }
}
