package com.ptmix.store.handler;

import com.ptmix.domain.Manufacturer;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ManufacturerTypeHandler implements TypeHandler<Manufacturer> {

	@Override
	public Manufacturer getResult(ResultSet rs, String columnName) throws SQLException {
		//
		String value = rs.getString(columnName);
		return Manufacturer.valueOf(value);
	}

	@Override
	public Manufacturer getResult(ResultSet rs, int columnIndex) throws SQLException {
		//
		String value = rs.getString(columnIndex);
		return Manufacturer.valueOf(value);
	}

	@Override
	public Manufacturer getResult(CallableStatement arg0, int arg1) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setParameter(PreparedStatement pstmt, int paramIndex, Manufacturer param, JdbcType jdbcType) throws SQLException {
		//
		pstmt.setString(paramIndex, param.toString());
	}

}
