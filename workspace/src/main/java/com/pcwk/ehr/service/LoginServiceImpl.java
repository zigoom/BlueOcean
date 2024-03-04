package com.pcwk.ehr.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.dao.LoginDao;
import com.pcwk.ehr.domain.UserVO;

@Service
public class LoginServiceImpl implements LoginService, PcwkLogger {

	@Autowired
	LoginDao loginDao;

	@Autowired
	PasswordEncoder passwordEncoder;

	public LoginServiceImpl() {
	}

	@Override
	public int doLogin(UserVO user) throws SQLException {
		// 1. 아이디 check
		// 2. 비번 check
		int checkStatus = 0; // 10(id오류),20(비번오류),30(성공)

		/* UserVO storedUser = loginDao.get(user); */
		
		int idCheck = loginDao.idCheck(user);
		LOG.debug("idCheck: "+ idCheck);
		if (idCheck == 1) {
		    UserVO storedUser = loginDao.get(user);
		    LOG.debug("user : "+user);
		    
		    
		    String inputPassword = user.getPasswd(); // 입력된 비밀번호 가져오기
		    String storedEncryptedPassword = storedUser.getPasswd(); // DB에 저장된 암호화된 비밀번호
		    
		    LOG.debug("입력된 비밀번호: " + inputPassword);
		    LOG.debug("DB에 저장된 암호화된 비밀번호: " + storedEncryptedPassword);
		    
		    if (storedUser != null && passwordEncoder.matches(inputPassword, storedUser.getPasswd())) {
		    	if (storedUser != null && storedUser.getWithdrawl() == 0) {
			    	LOG.debug("비밀번호 찾기성공: ");
			    	checkStatus = 30; // 로그인 성공
				}
		    	else {
		    		checkStatus = 40;
				}

		    } else {
		        checkStatus = 20; // 비밀번호 오류
		        LOG.debug("비밀번호 오류: " + inputPassword);
		    }
		} else {
		    checkStatus = 10; // 아이디 오류
		}


		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ checkStatus ()           │" + checkStatus);
		LOG.debug("└──────────────────────────┘");

		return checkStatus;
	}

	@Override
	public UserVO get(UserVO user) throws SQLException, ClassNotFoundException {
		LOG.debug("3.user:" + user);
		return loginDao.get(user);
	}

}
