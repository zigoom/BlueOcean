package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.dao.AdminTermsofuseDao;

@Service("AdminTermsofuseService")
public class AdminTermsofuseServiceImpl implements AdminTermsofuseService, PcwkLogger{

	@Autowired
	AdminTermsofuseDao adminTermsofuseDao;
	
	@Override
	public int doSave(AdminPageVO inVO) throws SQLException {
		return 0;
	}

	@Override
	public int doDelete(AdminPageVO inVO) throws SQLException {
		return 0;
	}

	@Override
	public int doUpdate(AdminPageVO inVO) throws SQLException {
		return 0;
	}

	@Override
	public AdminPageVO doSelectOne(AdminPageVO inVO) throws SQLException {
		return null;
	}
	
	/**
	 * 이용약관 조회
	 */
	@Override
	public List<AdminPageVO> doRetrieve(AdminPageVO inVO) throws SQLException {
		return adminTermsofuseDao.doRetrieve(inVO);
	}
	
	
}
