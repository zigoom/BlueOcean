package com.pcwk.ehr.service;


import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.dao.LoginDao;
import com.pcwk.ehr.domain.UserVO;

@Service
public class LoginServiceImpl implements LoginService, PcwkLogger{
	
	@Autowired
	LoginDao loginDao;

	public LoginServiceImpl() {
	}
	
	@Override
	public int doLogin(UserVO user) throws SQLException {
		// 1. 아이디 check
		// 2. 비번 check
		int checkStatus = 0; // 10(id오류),20(비번오류),30(성공)

		int status = this.loginDao.idCheck(user);

		if (1 == status) {

			status = loginDao.passCheck(user);

			if (1 == status) {
				checkStatus = 30;// 로그인 성공
			} else {
				checkStatus = 20;// 비번 오류,id있음
			}

		} else {
			checkStatus = 10;// id없음
		}

		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ checkStatus ()           │" + checkStatus);
		LOG.debug("└──────────────────────────┘");

		return checkStatus;
		}
		
		@Override
		public UserVO get(UserVO user) throws SQLException, ClassNotFoundException {
			// TODO Auto-generated method stub
			return loginDao.get(user);
		}
	
}
