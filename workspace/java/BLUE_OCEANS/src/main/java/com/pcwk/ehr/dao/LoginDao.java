package com.pcwk.ehr.dao;

import java.sql.SQLException;

import com.pcwk.ehr.domain.UserVO;

public interface LoginDao {

	int idCheck(UserVO user) throws SQLException;

 
	UserVO get(UserVO user) throws ClassCastException, SQLException;

}
