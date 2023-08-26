package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.dao.SignUpDaoImpl;
import com.pcwk.ehr.domain.UserVO;

@Service
public class SignUpServiceImpl implements SignUpService, PcwkLogger {
	
	@Autowired
	SignUpDaoImpl signUpDaoImpl;
	
	@Autowired
    PasswordEncoder passwordEncoder;

	public SignUpServiceImpl() {
	}
	 
	@Override
	public int add(UserVO userVO) throws ClassNotFoundException, SQLException {

		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│ServiceImpl 구역                                   │" + userVO.toString());
		LOG.debug("└──────────────────────────────┘");
		
		userVO.setUserLevel(1);
		
		// 비밀번호 암호화
        String encryptedPassword = passwordEncoder.encode(userVO.getPasswd());
        userVO.setPasswd(encryptedPassword);
        
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

	@Override
	public int agree(UserVO userVO) {
		int totalCount = signUpDaoImpl.getTotalTermsOfUseCount();
		LOG.debug("totalCount : "+totalCount);
		int result = 0;
	    for (int i = 1; i <= totalCount; i++) {
	        List<Integer> termsOfUseNos = new ArrayList<Integer>();
	        termsOfUseNos.add(i);
	        LOG.debug("totalCount : "+termsOfUseNos);
	        userVO.setTermsOfUse(termsOfUseNos);
	        LOG.debug("totalCount : "+termsOfUseNos);
	        result += signUpDaoImpl.agree(userVO);
	    }

		return result;
	}

	@Override
	public List<UserVO> doRetrieveTermsofuse(UserVO inVO) throws SQLException {
		return signUpDaoImpl.doRetrieveTermsofuse(inVO);
	}



}
