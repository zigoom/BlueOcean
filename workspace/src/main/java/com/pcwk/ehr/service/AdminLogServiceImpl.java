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

	@Override
	public List<AdminPageVO> loadLog() throws SQLException {
		return adminLogDao.loadLog();
	}

	@Override
	public List<AdminPageVO> loadLogOption(AdminPageVO vo) throws SQLException {
		return adminLogDao.loadLogOption(vo);
	}

	@Override
	public int loadLogCount() throws SQLException {
		return adminLogDao.loadLogCount();
	}

	@Override
	public int loadLogCountOption(AdminPageVO vo) throws SQLException {
		return adminLogDao.loadLogCountOption(vo);
	}

	@Override
	public List<AdminPageVO> loadLogFromId(AdminPageVO vo) throws SQLException {
		return adminLogDao.loadLogFromId(vo);
	}

	@Override
	public List<AdminPageVO> loadLogOptionFromId(AdminPageVO vo) throws SQLException {
		return adminLogDao.loadLogOptionFromId(vo);
	}
	
	
	

	

}
