package com.ptmix.store;

import com.ptmix.domain.Customer;
import com.ptmix.domain.CustomerTouch;

import java.util.List;

public interface CustomerStore {
	//
	List<Customer> retrieveAll();
	Customer retrieve(String customerId);
	String create(Customer customer);
	void update(Customer customer);
	List<Customer> retrieveByName(String name);

	List<CustomerTouch> retrieveTouchs(String customerId);
	String createTouch(CustomerTouch customerTouch);

}
