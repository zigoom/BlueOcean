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
	
	/**
	 * 이용약관 조회
	 */
	@Override
	public List<AdminPageVO> doRetrieveTermsofuse(AdminPageVO inVO) throws SQLException {
		return adminTermsofuseDao.doRetrieveTermsofuse(inVO);
	}
	
	
}
