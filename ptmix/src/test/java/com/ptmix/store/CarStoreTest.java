package com.ptmix.store;

import org.junit.Test;

import com.ptmix.store.logic.CarStoreLogic;

public class CarStoreTest {
	//
	private CarStore carStore = new CarStoreLogic();;
	
	@Test
	public void testRetrieveAll() {
		//
		carStore.retrieveAll();
	}
	
}
