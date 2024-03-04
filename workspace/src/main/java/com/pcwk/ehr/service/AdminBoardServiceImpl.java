package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.dao.AdminBoardDao;
import com.pcwk.ehr.dao.AdminMemberDao;

@Service("AdminBoardService")
public class AdminBoardServiceImpl implements AdminBoardService, PcwkLogger {
	@Autowired
	private AdminBoardDao adminBoardDao;
	
	@Override
	public List<AdminPageVO> loadBoard() throws SQLException {
		return adminBoardDao.loadBoard();
	}

	@Override
	public List<AdminPageVO> loadBoardOption(AdminPageVO vo) throws SQLException {
		return adminBoardDao.loadBoardOption(vo);
	}

	@Override
	public List<AdminPageVO> loadBoardFromTitle(AdminPageVO vo) throws SQLException {
		return adminBoardDao.loadBoardFromTitle(vo);
	}

	@Override
	public int loadBoardCount() throws SQLException {
		return adminBoardDao.loadBoardCount();
	}

	@Override
	public int loadBoardCountOption(AdminPageVO vo) throws SQLException {
		return adminBoardDao.loadBoardCountOption(vo);
	}

	@Override
	public int deleteBoard(AdminPageVO vo) throws SQLException {
		return adminBoardDao.deleteBoard(vo);
	}

	@Override
	public int notdeleteBoard(AdminPageVO vo) throws SQLException {
		return adminBoardDao.notdeleteBoard(vo);
	}
	

	

}
