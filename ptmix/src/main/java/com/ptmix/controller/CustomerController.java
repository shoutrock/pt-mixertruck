package com.ptmix.controller;

import com.ptmix.domain.Customer;
import com.ptmix.domain.CustomerTouch;
import com.ptmix.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
@RequestMapping("/customer")
public class CustomerController {
	//
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping("/list.do")
	public String findAllCustomers(Model model) {
		//
		List<Customer> customers = customerService.findAllCustomers();
		model.addAttribute("customers", customers);
		
		return "/views/customerList.jsp";
	}
	
	@RequestMapping("/find.ajax")
	@ResponseBody
	public Customer findCustomer(String customerId) {
		//
		return customerService.findCustomer(customerId);
	}
	
	@RequestMapping("/findByName.ajax")
	@ResponseBody
	public List<Customer> findByName(String name) {
		//
		return customerService.findByName(name);
	}
	
	@RequestMapping("/regist.do")
	public String registCustomer(Customer customer) {
		//
		System.out.println(customer.getName());
		System.out.println(customer.getJuminNo());
		System.out.println(customer.getPhone());
		System.out.println(customer.getAddress());
		System.out.println(customer.getRemark());
		
		customerService.registCustomer(customer);
		return "redirect:/customer/list.do";
	}

	@RequestMapping("/touch/list.do")
	public String findCustomerTouches(String customerId, Model model) {
		//
		Customer customer = customerService.findCustomer(customerId);
		List<CustomerTouch> customerTouches = customerService.findTouchs(customerId);
		model.addAttribute("customer", customer);
		model.addAttribute("customerTouchs", customerTouches);

		return "/views/customerTouch.jsp";
	}

	@RequestMapping("/touch/regist.do")
	public String registCustomerTouch(CustomerTouch customerTouch) {
		//
		System.out.println(customerTouch.getCustomerId());
		System.out.println(customerTouch.getMeetDate());
		System.out.println(customerTouch.getContents());

		customerService.registTouch(customerTouch);
		return "redirect:/customer/touch/list.do?customerId=" + customerTouch.getCustomerId();
	}
}
