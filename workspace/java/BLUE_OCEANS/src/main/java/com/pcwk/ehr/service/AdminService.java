package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.dao.AdminDao;

public interface AdminService {
	List<AdminPageVO> loadMember() throws SQLException;

	List<AdminPageVO> loadMemberOption(AdminPageVO vo) throws SQLException;

	int loadMemberCount() throws SQLException;

	int loadMemberCountOption(AdminPageVO vo) throws SQLException;

	int deleteMember(AdminPageVO vo) throws SQLException;

	int notdeleteMember(AdminPageVO vo) throws SQLException;

}
