package com.pcwk.ehr.service;

import java.sql.SQLException;

import com.pcwk.ehr.domain.UserVO;

public interface FindService  {

	String findId(UserVO user) throws SQLException, ClassNotFoundException;
 
	
}
