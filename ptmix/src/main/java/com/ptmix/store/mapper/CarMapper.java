package com.ptmix.store.mapper;

import com.ptmix.domain.Car;
import com.ptmix.domain.Maintenance;
import com.ptmix.domain.Purchase;
import com.ptmix.domain.Sell;
import com.ptmix.domain.search.CarSearchKey;

import java.util.List;

public interface CarMapper {
	//
	List<Car> selectAllCars();
	Purchase selectPurchase(String carId);
	Sell selectSell(String carId);
	List<Maintenance> selectMaintenances(String carId);
	List<Car> selectCarsByKey(CarSearchKey searchKey);
	Car selectCar(String carId);
	
	void insertCar(Car car);
	void insertPurchase(Purchase purchase);
	void insertSell(Sell sell);
	void insertMaintenance(Maintenance maintenance);
	
	void updatePurchase(Purchase purchase);
	void updateSell(Sell sell);
	void updateMaintenance(Maintenance maintenance);
}
