package com.pcwk.ehr.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.AdminPageVO;

public interface AdminLogDao {

	int addLog(AdminPageVO vo) throws SQLException;

	List<AdminPageVO> loadLog() throws SQLException;

	List<AdminPageVO> loadLogOption(AdminPageVO vo) throws SQLException;

	int loadLogCount() throws SQLException;

	int loadLogCountOption(AdminPageVO vo) throws SQLException;
	
	List<AdminPageVO> loadLogFromId(AdminPageVO vo)throws SQLException;
	
	List<AdminPageVO> loadLogOptionFromId(AdminPageVO vo)throws SQLException;
}
