package com.ptmix.store;

import com.ptmix.domain.Car;
import com.ptmix.domain.Maintenance;
import com.ptmix.domain.Purchase;
import com.ptmix.domain.Sell;
import com.ptmix.domain.search.CarSearchKey;

import java.util.List;

public interface CarStore {
	//
	List<Car> retrieveAll();
	Car retrieve(String carId);
	String createCar(Car car);
	List<Car> retrieveByKey(CarSearchKey searchKey);
	
	void createSell(Sell sell);
	void createPurchase(Purchase purchase);
	String createMaintenance(Maintenance maintenance);
	List<Maintenance> retrieveMaintenances(String carId);
	
}
