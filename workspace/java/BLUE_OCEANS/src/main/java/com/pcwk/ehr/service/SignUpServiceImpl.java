package com.pcwk.ehr.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.dao.SignUpDaoImpl;
import com.pcwk.ehr.domain.UserVO;

@Service
public class SignUpServiceImpl implements SignUpService, PcwkLogger {
	
	@Autowired
	SignUpDaoImpl signUpDaoImpl;

	public SignUpServiceImpl() {
	}
	 
	@Override
	public int add(UserVO userVO) throws ClassNotFoundException, SQLException {

		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│ServiceImpl 구역!!!!           │" + userVO.toString());
		LOG.debug("└──────────────────────────────┘");
		
		userVO.setUserLevel(1);
		userVO.setAgree(0);
		userVO.setOtpUse(0);
		
		
		int flag = 0;
		

		flag = this.signUpDaoImpl.add(userVO);

		// return flag = this.signUpDaoImpl.add(signUpVO);

		return flag;
	}

	@Override
	public int idCheck(String userId) throws Exception {

		int cnt = signUpDaoImpl.idCheck(userId);

		return cnt;
	}


}
