package com.ptmix.service.logic;

import com.ptmix.domain.Car;
import com.ptmix.domain.Maintenance;
import com.ptmix.domain.search.CarSearchKey;
import com.ptmix.service.CarService;
import com.ptmix.store.CarStore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CarServiceLogic implements CarService {
	//
	@Autowired
	private CarStore carStore;
	
	@Override
	public List<Car> findAllCars() {
		//
		return carStore.retrieveAll();
	}

	@Override
	public void registCar(Car car) {
		//
		//1. 차량 기본정보
		String carId = carStore.createCar(car);
		//2. 구매정보
		car.getPurchase().setCarId(carId);
		carStore.createPurchase(car.getPurchase());
	}

	@Override
	public List<Car> findByKey(CarSearchKey searchKey) {
		//
		return carStore.retrieveByKey(searchKey);
	}

    @Override
    public String registMaintenance(Maintenance maintenance) {
        //
        return carStore.createMaintenance(maintenance);
    }

    @Override
    public List<Maintenance> findMaintenances(String carId) {
        //
        return carStore.retrieveMaintenances(carId);
    }

    @Override
    public Car find(String carId) {
        //
        Car car = carStore.retrieve(carId);
        List<Maintenance> maintenances = carStore.retrieveMaintenances(carId);
        car.setMaintenances(maintenances);
        return car;
    }
}
