package com.pcwk.ehr.dao;

import java.sql.SQLException;

import com.pcwk.ehr.domain.UserVO;


public interface OtpDao {
	
	//otp 설정
	public String setOtp(UserVO userVO) throws ClassNotFoundException, SQLException;

	//otp 초기화
	public String reSetOtp(UserVO userVO) throws Exception;

	String selectOtp(UserVO userVO) throws Exception;
}
