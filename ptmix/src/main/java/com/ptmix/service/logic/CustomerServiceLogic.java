package com.ptmix.service.logic;

import com.ptmix.domain.Customer;
import com.ptmix.domain.CustomerTouch;
import com.ptmix.service.CustomerService;
import com.ptmix.store.CustomerStore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceLogic implements CustomerService {
	//
	@Autowired
	private CustomerStore customerStore;
	
	@Override
	public List<Customer> findAllCustomers() {
		//
		return customerStore.retrieveAll();
	}

	@Override
	public void registCustomer(Customer customer) {
		//
		customerStore.create(customer);
	}

	@Override
	public Customer findCustomer(String customerId) {
		//
		return customerStore.retrieve(customerId);
	}

	@Override
	public List<Customer> findByName(String name) {
		//
		return customerStore.retrieveByName(name);
	}

	@Override
	public List<CustomerTouch> findTouchs(String customerId) {
		//
		return customerStore.retrieveTouchs(customerId);
	}

	@Override
	public void registTouch(CustomerTouch customerTouch) {
		//
		customerStore.createTouch(customerTouch);
	}
}
