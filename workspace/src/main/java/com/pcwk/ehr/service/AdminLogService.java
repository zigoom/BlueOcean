package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.dao.AdminMemberDao;

public interface AdminLogService {

	int addLog(AdminPageVO vo) throws SQLException;

	List<AdminPageVO> loadLog() throws SQLException;

	List<AdminPageVO> loadLogOption(AdminPageVO vo)throws SQLException;

	int loadLogCount() throws SQLException;

	int loadLogCountOption(AdminPageVO vo) throws SQLException;
	
	List<AdminPageVO> loadLogFromId(AdminPageVO vo)throws SQLException;
	
	List<AdminPageVO> loadLogOptionFromId(AdminPageVO vo)throws SQLException;

}
