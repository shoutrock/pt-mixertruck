package com.ptmix.store.mapper;

import com.ptmix.domain.Customer;
import com.ptmix.domain.CustomerTouch;

import java.util.List;

public interface CustomerMapper {
	//
	Customer select(String customerId);
	List<Customer> selectAll();
	void insert(Customer customer);
	List<Customer> selectByName(String name);

	void insertTouch(CustomerTouch customerTouch);
	List<CustomerTouch> selectTouches(String customerId);
}
