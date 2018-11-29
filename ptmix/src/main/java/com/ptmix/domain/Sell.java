package com.ptmix.domain;

import java.sql.Date;

public class Sell {
	//
	private String usid;
	private Date sellDate;
	private long amount;
	private long declaredAmount; //신고금액
	private Customer buyer;
	
	private String carId;
	
	public Sell() {
		//empty
	}

	public String getUsid() {
		return usid;
	}

	public void setUsid(String usid) {
		this.usid = usid;
	}

	public Date getSellDate() {
		return sellDate;
	}

	public void setSellDate(Date sellDate) {
		this.sellDate = sellDate;
	}

	public long getAmount() {
		return amount;
	}

	public void setAmount(long amount) {
		this.amount = amount;
	}

	public long getDeclaredAmount() {
		return declaredAmount;
	}

	public void setDeclaredAmount(long declaredAmount) {
		this.declaredAmount = declaredAmount;
	}

	public Customer getBuyer() {
		return buyer;
	}

	public void setBuyer(Customer buyer) {
		this.buyer = buyer;
	}

	public String getCarId() {
		return carId;
	}

	public void setCarId(String carId) {
		this.carId = carId;
	}
	
}
