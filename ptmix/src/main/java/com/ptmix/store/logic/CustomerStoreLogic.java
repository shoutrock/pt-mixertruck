package com.ptmix.store.logic;

import com.ptmix.domain.Customer;
import com.ptmix.domain.CustomerTouch;
import com.ptmix.store.CustomerStore;
import com.ptmix.store.mapper.CustomerMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerStoreLogic implements CustomerStore {
	//
	private PtmixSessionFactory sessionFactory;
	
	public CustomerStoreLogic() {
		//
		this.sessionFactory = PtmixSessionFactory.createInstance();
	}
	@Override
	public List<Customer> retrieveAll() {
		//
		SqlSession sqlSession = sessionFactory.getSession();
		CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
		List<Customer> customers = customerMapper.selectAll();
		sqlSession.close();
		return customers;
	}

	@Override
	public Customer retrieve(String customerId) {
		//
		SqlSession sqlSession = sessionFactory.getSession();
		CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
		Customer customer = customerMapper.select(customerId);
		sqlSession.close();
		return customer;
	}

	@Override
	public String create(Customer customer) {
		//
		SqlSession sqlSession = sessionFactory.getSession();
		CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
		customerMapper.insert(customer);
		sqlSession.close();
		return customer.getUsid();
	}

	@Override
	public void update(Customer customer) {
		// TODO Auto-generated method stub

	}
	
	@Override
	public List<Customer> retrieveByName(String name) {
		//
		SqlSession sqlSession = sessionFactory.getSession();
		CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
		List<Customer> customers = customerMapper.selectByName(name+"%");
		sqlSession.close();
		return customers;
	}

	@Override
	public List<CustomerTouch> retrieveTouchs(String customerId) {
		//
		SqlSession sqlSession = sessionFactory.getSession();
		CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
		List<CustomerTouch> customerTouces = customerMapper.selectTouches(customerId);
		sqlSession.close();
		return customerTouces;
	}

	@Override
	public String createTouch(CustomerTouch customerTouch) {
        //
        SqlSession sqlSession = sessionFactory.getSession();
        CustomerMapper customerMapper = sqlSession.getMapper(CustomerMapper.class);
        customerMapper.insertTouch(customerTouch);
        sqlSession.close();
        return customerTouch.getUsid();
	}
}
