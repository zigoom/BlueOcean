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

	@Override
	public int userCheck(UserVO user)throws SQLException, ClassNotFoundException {
		int flag = 0;
		
		int status = this.findIdDao.userCheck(user);
		
		if (status == 1) {
			reSetPasswd(user);
			flag = 1;
		}
		
		
		return flag;
	}
	
	@Override
	public int reSetPasswd(UserVO user) throws SQLException, ClassNotFoundException {
        int min = 100000;
        int max = 999999;
		
		Random random = new Random();
		
		int otp = random.nextInt(max - min + 1) + min;
		
		user.setPasswd(String.valueOf(otp));
		
		
		return otp;
	}
	

	


	
	
	
}
