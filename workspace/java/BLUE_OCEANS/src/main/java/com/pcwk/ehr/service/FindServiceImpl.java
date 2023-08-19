package com.pcwk.ehr.service;


import java.sql.SQLException;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.dao.FindDao;
import com.pcwk.ehr.domain.UserVO;

@Service
public class FindServiceImpl implements FindService, PcwkLogger{
	
	@Autowired
	FindDao findIdDao;

	public FindServiceImpl() {
	}
 
	@Override
	public String findId(UserVO user) throws SQLException, ClassNotFoundException {
		// 1. 아이디 check
		// 2. 비번 check

		String foundId = findIdDao.findId(user);


		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ findId                   │" + foundId);
		LOG.debug("└──────────────────────────┘");

		return foundId;
	}


	
	
	
}
