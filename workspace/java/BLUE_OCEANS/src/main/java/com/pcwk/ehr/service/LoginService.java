package com.pcwk.ehr.service;

import java.sql.SQLException;

import com.pcwk.ehr.domain.UserVO;

public interface LoginService  {
 
	int doLogin(UserVO user) throws SQLException;

	UserVO get(UserVO user) throws SQLException, ClassNotFoundException;

}
