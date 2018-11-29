package com.ptmix.controller;

import com.ptmix.domain.Car;
import com.ptmix.domain.Maintenance;
import com.ptmix.domain.search.CarSearchKey;
import com.ptmix.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/car")
public class CarController {
	//
	@Autowired
	private CarService carService;
	
	@RequestMapping("/list.do")
	public String findAllCars(Model model) {
		//
		List<Car> cars = carService.findAllCars();
		model.addAttribute("cars", cars);
		return "/views/carList.jsp";
	}
	
	@RequestMapping("/findBy.do")
	public String findByKey(CarSearchKey searchKey) {
		//
		System.out.println(searchKey.getDateType());
		System.out.println(searchKey.getFromDate());
		System.out.println(searchKey.getToDate());
		System.out.println(searchKey.getCustomerType());
		System.out.println(searchKey.getCustomerName());
		return "/views/carList.jsp";
	}
	
	@RequestMapping("/regist.do")
	public String registCar(Car car) {
		//
		System.out.println(car.getName());
		System.out.println(car.getManufacturer());
		System.out.println(car.getProductionDate());
		System.out.println(car.getPurchase().getAmount());
		System.out.println(car.getPurchase().getPurchaseDate());
		System.out.println(car.getPurchase().getSeller().getUsid());
		System.out.println(car.getPurchase().getSeller().getRemark());
		carService.registCar(car);
		return "redirect:/car/list.do";
	}

	@RequestMapping("/maintenance/regist.ajax")
    @ResponseBody
	public String registMaintenance(Maintenance maintenance) {
		//
        System.out.println(maintenance.getItem());
        System.out.println(maintenance.getAmount());
        System.out.println(maintenance.getCarId());
        return carService.registMaintenance(maintenance);
	}

	@RequestMapping("/maintenance/find.ajax")
    @ResponseBody
	public Car findCar(String carId) {
	    //
        return carService.find(carId);
    }
}
