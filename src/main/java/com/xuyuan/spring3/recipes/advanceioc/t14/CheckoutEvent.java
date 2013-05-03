package com.xuyuan.spring3.recipes.advanceioc.t14;

import java.util.Date;

import org.springframework.context.ApplicationEvent;

/**
 * 2-14. Communicating with Application Events
 * Suppose you would like your cashier bean to publish a  CheckoutEvent after the shopping cart has been checked out. 
 * 
 * 1.define the event:
 *   all events must extend the abstract class  ApplicationEvent and pass the event source as a constructor argument.
 * @author Administrator
 *
 */
public class CheckoutEvent extends ApplicationEvent {

    /**
	 * @uml.property  name="amount"
	 */
    private double amount;
    /**
	 * @uml.property  name="time"
	 */
    private Date time;

    public CheckoutEvent(Object source, double amount, Date time) {
        super(source);
        this.amount = amount;
        this.time = time;
    }

    /**
	 * @return
	 * @uml.property  name="amount"
	 */
    public double getAmount() {
        return amount;
    }

    /**
	 * @return
	 * @uml.property  name="time"
	 */
    public Date getTime() {
        return time;
    }
}
