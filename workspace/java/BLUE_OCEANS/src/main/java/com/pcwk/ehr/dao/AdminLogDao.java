package com.pcwk.ehr.dao;

import java.sql.SQLException;

import com.pcwk.ehr.cmn.AdminPageVO;

public interface AdminLogDao {

	
	int addLog(AdminPageVO vo) throws SQLException;
}
