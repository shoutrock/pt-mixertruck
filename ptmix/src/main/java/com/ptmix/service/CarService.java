package com.ptmix.service;

import com.ptmix.domain.Car;
import com.ptmix.domain.Maintenance;
import com.ptmix.domain.search.CarSearchKey;

import java.util.List;

public interface CarService {
	//
	List<Car> findAllCars();
	void registCar(Car car);
	List<Car> findByKey(CarSearchKey searchKey);
	String registMaintenance(Maintenance maintenance);
	List<Maintenance> findMaintenances(String carId);
	Car find(String carId);
}
