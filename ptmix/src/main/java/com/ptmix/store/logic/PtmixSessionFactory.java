package com.ptmix.store.logic;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class PtmixSessionFactory {
	//
	private static PtmixSessionFactory instance;
	private SqlSessionFactory sessionFactory;
	
	private PtmixSessionFactory() {
		//
		try {
			InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
			sessionFactory = new SqlSessionFactoryBuilder().build(is);
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public static PtmixSessionFactory createInstance() {
		//
		if(instance == null) {
			instance = new PtmixSessionFactory();
		}
		
		return instance;
	}
	
	public SqlSession getSession() {
		//
		return sessionFactory.openSession(true);
	}
}
