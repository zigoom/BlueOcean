package com.pcwk.ehr.dao;

import java.sql.SQLException;

import com.pcwk.ehr.domain.UserVO;

public interface FindDao {

	String findId(UserVO user) throws SQLException, ClassNotFoundException;

	int userCheck(UserVO user) throws SQLException, ClassNotFoundException;
	
	int updateOTP(UserVO user) throws SQLException, ClassNotFoundException;
	 
}
