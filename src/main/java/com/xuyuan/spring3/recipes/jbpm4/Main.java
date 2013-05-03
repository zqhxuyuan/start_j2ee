package com.xuyuan.spring3.recipes.jbpm4;

import com.xuyuan.spring3.recipes.jbpm4.customers.Customer;
import com.xuyuan.spring3.recipes.jbpm4.customers.CustomerService;

import org.springframework.context.support.ClassPathXmlApplicationContext;


/**
 * This class is the launching point of a simple jBPM based service case
 */
public class Main {
    public static void main(String[] args) throws Throwable {
        ClassPathXmlApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/23/context1.xml");
        applicationContext.start();

        CustomerService customerService = (CustomerService) applicationContext.getBean("customerService");
        Customer customer = customerService.createCustomer("user@userssite.com", "password", "First", "Last");
        customerService.authorizeCustomer(customer.getId());
    }
}
