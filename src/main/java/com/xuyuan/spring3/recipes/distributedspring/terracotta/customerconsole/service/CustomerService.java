package com.xuyuan.spring3.recipes.distributedspring.terracotta.customerconsole.service;

import com.xuyuan.spring3.recipes.distributedspring.terracotta.customerconsole.entity.Customer;

import java.util.Collection;
import java.util.Date;


public interface CustomerService {
    Customer getCustomerById(String id);

    Customer createCustomer(String firstName, String lastName, Date birthdate);

    Customer removeCustomer(String id);

    Customer updateCustomer(String id, String firstName, String lastName, Date birthdate);

    Collection<Customer> getAllCustomers();
}
