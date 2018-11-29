package com.ptmix.domain;

import java.sql.Date;
import java.util.List;

public class Car {
	//
	private String usid;
	
	//car specification
	private Manufacturer manufacturer;
	private String name;
	private Date productionDate;

	private Purchase purchase;
	private Sell sell;
	private List<Maintenance> maintenances;

	public Car() {
		//empty
	}

	public long getMaintenanceAmount() {
	    //
        long amount = 0;
        if(maintenances == null) {
            return amount;
        }

        for(Maintenance maintenance : maintenances) {
            amount += maintenance.getAmount();
        }

        return amount;
    }

	public String getUsid() {
		return usid;
	}

	public void setUsid(String usid) {
		this.usid = usid;
	}

	public Manufacturer getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(Manufacturer manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getProductionDate() {
		return productionDate;
	}

	public void setProductionDate(Date productionDate) {
		this.productionDate = productionDate;
	}

	public Purchase getPurchase() {
		return purchase;
	}

	public void setPurchase(Purchase purchase) {
		this.purchase = purchase;
	}

	public Sell getSell() {
		return sell;
	}

	public void setSell(Sell sell) {
		this.sell = sell;
	}

	public List<Maintenance> getMaintenances() {
		return maintenances;
	}

	public void setMaintenances(List<Maintenance> maintenances) {
		this.maintenances = maintenances;
	}
}
