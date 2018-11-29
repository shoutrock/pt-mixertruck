package com.ptmix.store.handler;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class NumberToStringHandler implements TypeHandler<String> {

	@Override
	public void setParameter(PreparedStatement ps, int i, String parameter, JdbcType jdbcType) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String getResult(ResultSet rs, String columnName) throws SQLException {
		//
		long value = rs.getLong(columnName);
		return value + "";
	}

	@Override
	public String getResult(ResultSet rs, int columnIndex) throws SQLException {
		//
		long value = rs.getLong(columnIndex);
		return value + "";
	}

	@Override
	public String getResult(CallableStatement cs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
