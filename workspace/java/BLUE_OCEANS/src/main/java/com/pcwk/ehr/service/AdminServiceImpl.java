package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.dao.AdminDao;

@Service("AdminService")
public class AdminServiceImpl implements AdminService, PcwkLogger {
	@Autowired
	private AdminDao adminDao;

	@Override
	public List<AdminPageVO> loadMember() throws SQLException {
		return adminDao.loadMember();
	}

	@Override
	public List<AdminPageVO> loadMemberOption(AdminPageVO vo) throws SQLException {
		return adminDao.loadMemberOption(vo);
	}
	
	@Override
	public int loadMemberCount() throws SQLException {
		return adminDao.loadMemberCount();
	}

	@Override
	public int loadMemberCountOption(AdminPageVO vo) throws SQLException {
		return adminDao.loadMemberCountOption(vo);
	}

	@Override
	public int deleteMember(AdminPageVO vo) throws SQLException {
		return adminDao.deleteMember(vo);
	}

	@Override
	public int notdeleteMember(AdminPageVO vo) throws SQLException {
		return adminDao.notdeleteMember(vo);
	}

	

}
