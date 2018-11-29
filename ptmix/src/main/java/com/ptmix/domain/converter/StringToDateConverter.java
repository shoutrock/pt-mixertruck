package com.ptmix.domain.converter;

import org.springframework.core.convert.converter.Converter;

import java.sql.Date;

public class StringToDateConverter implements Converter<String, Date> {

	@Override
	public Date convert(String date) {
		//
		return Date.valueOf(date);
	}

}
