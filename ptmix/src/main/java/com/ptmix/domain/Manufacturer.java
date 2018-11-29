package com.ptmix.domain;

public enum Manufacturer {
	//
	Hyundai("현대")
	,Daewoo("대우")
	,Ssangyong("쌍용")
	,Asia("아시아")
	,Samsung("삼성")
	,Etc("기타");
	
	private String name;
	
	private Manufacturer(String name) {
		//
		this.name = name;
	}
	
	public String getName() {
		return this.name;
	}
}
