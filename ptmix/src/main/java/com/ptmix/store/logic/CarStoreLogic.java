package com.ptmix.store.logic;

import com.ptmix.domain.Car;
import com.ptmix.domain.Maintenance;
import com.ptmix.domain.Purchase;
import com.ptmix.domain.Sell;
import com.ptmix.domain.search.CarSearchKey;
import com.ptmix.store.CarStore;
import com.ptmix.store.mapper.CarMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CarStoreLogic implements CarStore {
	//
	private PtmixSessionFactory sessionFactory;
	
	public CarStoreLogic() {
		//
		this.sessionFactory = PtmixSessionFactory.createInstance();
	}

	@Override
	public List<Car> retrieveAll() {
		//
		SqlSession sqlSession = sessionFactory.getSession();
		CarMapper carMapper = sqlSession.getMapper(CarMapper.class);
		
		List<Car> cars = carMapper.selectAllCars();
		for(Car car : cars) {
			List<Maintenance> maintenances = carMapper.selectMaintenances(car.getUsid());
			Purchase purchase = carMapper.selectPurchase(car.getUsid());
			Sell sell = carMapper.selectSell(car.getUsid());
			
			if(sell != null) {
				System.out.println("usid : " + sell.getUsid());
				System.out.println(sell.getSellDate());
				System.out.println(sell.getAmount());
				System.out.println(sell.getDeclaredAmount());
				System.out.println(sell.getBuyer().getUsid());
				System.out.println(sell.getBuyer().getName());
				System.out.println("carId : " + sell.getCarId());
			}
			car.setMaintenances(maintenances);
			car.setPurchase(purchase);
			car.setSell(sell);
		}
		sqlSession.close();
		return cars;
	}

	@Override
	public Car retrieve(String carId) {
		//
		SqlSession sqlSession = sessionFactory.getSession();
		CarMapper carMapper = sqlSession.getMapper(CarMapper.class);
        Car car = carMapper.selectCar(carId);
        sqlSession.close();
        return car;
	}

	@Override
	public void createSell(Sell sell) {
		//
		SqlSession sqlSession = sessionFactory.getSession();
		CarMapper carMapper = sqlSession.getMapper(CarMapper.class);
		carMapper.insertSell(sell);
		sqlSession.close();
	}

	@Override
	public String createMaintenance(Maintenance maintenance) {
		//
        SqlSession sqlSession = sessionFactory.getSession();
        CarMapper carMapper = sqlSession.getMapper(CarMapper.class);
        carMapper.insertMaintenance(maintenance);
        sqlSession.close();
        return maintenance.getUsid();
	}

	@Override
	public String createCar(Car car) {
		//
		SqlSession sqlSession = sessionFactory.getSession();
		CarMapper carMapper = sqlSession.getMapper(CarMapper.class);
		carMapper.insertCar(car);
		sqlSession.close();
		return car.getUsid();
	}

	@Override
	public void createPurchase(Purchase purchase) {
		//
		SqlSession sqlSession = sessionFactory.getSession();
		CarMapper carMapper = sqlSession.getMapper(CarMapper.class);
		carMapper.insertPurchase(purchase);
		sqlSession.close();
	}

	@Override
	public List<Car> retrieveByKey(CarSearchKey searchKey) {
		//
        SqlSession sqlSession = sessionFactory.getSession();
        CarMapper carMapper = sqlSession.getMapper(CarMapper.class);
        List<Car> cars = carMapper.selectCarsByKey(searchKey);
        sqlSession.close();
		return cars;
	}

    @Override
    public List<Maintenance> retrieveMaintenances(String carId) {
        //
        SqlSession sqlSession = sessionFactory.getSession();
        CarMapper carMapper = sqlSession.getMapper(CarMapper.class);
        List<Maintenance> maintenances = carMapper.selectMaintenances(carId);
        sqlSession.close();
	    return maintenances;
    }
}
