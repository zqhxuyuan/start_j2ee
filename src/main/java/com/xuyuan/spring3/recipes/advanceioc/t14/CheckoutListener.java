package com.xuyuan.spring3.recipes.advanceioc.t14;

import java.util.Date;

import org.springframework.context.ApplicationListener;

/**
 * Any bean defined in the application context that implements the ApplicationListener interface will be notified of all events.
 * 
 * 3.suppose you would like to send an e-mail to notify the customer about the checkout. 
 *
 */
public class CheckoutListener implements ApplicationListener<CheckoutEvent> {

    public void onApplicationEvent(CheckoutEvent event) {
        double amount = ((CheckoutEvent) event).getAmount();
        Date time = ((CheckoutEvent) event).getTime();

        // Do anything you like with the checkout amount and time
        System.out.println("Checkout event [" + amount + ", " + time + "]");
    }
}
