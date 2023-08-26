package com.pcwk.ehr.service;

import java.sql.SQLException;

import com.pcwk.ehr.domain.UserVO;

public interface FindService  {

	public String findId(UserVO user) throws SQLException, ClassNotFoundException;

	public String OTP(UserVO user) throws SQLException, ClassNotFoundException;

	public String checkOTP(UserVO user) throws SQLException, ClassNotFoundException, Exception;

	public UserVO resetPassWd(UserVO user) throws Exception;
	
	
	
}
