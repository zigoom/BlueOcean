package com.pcwk.ehr.dao;

import java.sql.SQLException;

import com.pcwk.ehr.domain.UserVO;


public interface SignUpDao {

	// 회원가입
	public int add(UserVO userVO) throws ClassNotFoundException, SQLException;
		
	
	//중복검사
	public int idCheck(String userId) throws Exception;
}
