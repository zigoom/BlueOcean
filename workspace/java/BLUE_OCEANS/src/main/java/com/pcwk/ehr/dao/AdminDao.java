package com.pcwk.ehr.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.AdminPageVO;

public interface AdminDao {
	List<AdminPageVO> loadMember() throws SQLException;
	
	List<AdminPageVO> loadMemberOption(AdminPageVO vo) throws SQLException;
	
	int loadMemberCount()throws SQLException;
	
	int loadMemberCountOption(AdminPageVO vo)throws SQLException;
	
	int deleteMember(AdminPageVO vo) throws SQLException;
	
	int notdeleteMember(AdminPageVO vo) throws SQLException;

}
