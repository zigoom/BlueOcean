package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.dao.AdminBoardDao;
import com.pcwk.ehr.dao.AdminLogDao;
import com.pcwk.ehr.dao.AdminMemberDao;

@Service("AdminLogService")
public class AdminLogServiceImpl implements AdminLogService, PcwkLogger {
	@Autowired
	private AdminLogDao adminLogDao;

	@Override
	public int addLog(AdminPageVO vo) throws SQLException {
		return adminLogDao.addLog(vo);
	}
	
	

	

}
