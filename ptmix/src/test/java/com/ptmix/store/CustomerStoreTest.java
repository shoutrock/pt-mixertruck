package com.ptmix.store;

import java.util.List;

import com.ptmix.domain.CustomerTouch;
import org.junit.Test;

import com.ptmix.domain.Customer;
import com.ptmix.store.logic.CustomerStoreLogic;

public class CustomerStoreTest {
	//
	private CustomerStore customerStore = new CustomerStoreLogic();
	
	@Test
	public void testRetrieveByName() {
		//
		String name = "정";
		List<Customer> customers = customerStore.retrieveByName(name);
		for(Customer customer : customers) {
			System.out.println(customer.getName());
		}
	}

	public void testCreateCustomerTouch() {
		//
		CustomerTouch customerTouch = new CustomerTouch();
	}
}
