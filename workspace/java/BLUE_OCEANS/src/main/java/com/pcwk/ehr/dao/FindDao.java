package com.pcwk.ehr.dao;

import java.sql.SQLException;

import com.pcwk.ehr.domain.UserVO;

public interface FindDao {

	public String findId(UserVO user) throws SQLException, ClassNotFoundException; 

	public int userCheck(UserVO user) throws SQLException, ClassNotFoundException;

	public int checkOTP(UserVO user) throws SQLException, ClassNotFoundException;

	public int usingOTP(UserVO user) throws SQLException, ClassNotFoundException;

	public int resetPassWd(UserVO user) throws Exception;
	
	public int setOtp(UserVO userVO) throws ClassNotFoundException, SQLException;

	public String selectOtp(UserVO userVO) throws Exception;

	public String reSetOtp(UserVO userVO) throws Exception;

	public int otpuserCheck(UserVO user) throws SQLException, ClassNotFoundException;

	public UserVO seletePasswd(UserVO user) throws Exception;

	
	 
}
