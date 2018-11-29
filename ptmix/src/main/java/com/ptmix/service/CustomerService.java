package com.ptmix.service;

import com.ptmix.domain.Customer;
import com.ptmix.domain.CustomerTouch;

import java.util.List;

public interface CustomerService {
	//
	List<Customer> findAllCustomers();
	Customer findCustomer(String customerId);
	void registCustomer(Customer customer);
	List<Customer> findByName(String name);

	List<CustomerTouch> findTouchs(String customerId);
	void registTouch(CustomerTouch customerTouch);
}
