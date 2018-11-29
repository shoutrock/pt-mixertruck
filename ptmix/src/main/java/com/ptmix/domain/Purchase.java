package com.ptmix.domain;

import java.sql.Date;

public class Purchase {
	//
	//TODO 구매금액 : 실제 거래금액과 세금계산서 거래금액이 있어야 함
	//TODO 자동차등록증 사본 (스캔이미지)
	private String usid;
	private Date purchaseDate;
	private long amount;
	private long declaredAmount;  //신고금액
	private Customer seller;
	
	public String carId;
	
	public Purchase() {
		//empty
	}

	public String getUsid() {
		return usid;
	}

	public void setUsid(String usid) {
		this.usid = usid;
	}

	public Date getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public long getAmount() {
		return amount;
	}

	public void setAmount(long amount) {
		this.amount = amount;
	}

	public Customer getSeller() {
		return seller;
	}

	public void setSeller(Customer seller) {
		this.seller = seller;
	}

	public String getCarId() {
		return carId;
	}

	public void setCarId(String carId) {
		this.carId = carId;
	}

	public long getDeclaredAmount() {
		return declaredAmount;
	}

	public void setDeclaredAmount(long declaredAmount) {
		this.declaredAmount = declaredAmount;
	}
}
