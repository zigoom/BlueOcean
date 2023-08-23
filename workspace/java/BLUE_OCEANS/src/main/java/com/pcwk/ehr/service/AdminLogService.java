package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.dao.AdminMemberDao;

public interface AdminLogService {
	
	int addLog(AdminPageVO vo) throws SQLException;
}
