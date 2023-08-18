package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.dao.OtpDaoImpl;
import com.pcwk.ehr.dao.SignUpDaoImpl;
import com.pcwk.ehr.domain.UserVO;

@Service
public class OtpServiceImpl implements OtpService, PcwkLogger {
	
	@Autowired	
	OtpDaoImpl otpDaoImpl; 

	public OtpServiceImpl() {
	}
	
	

	@Override
	public String setOtp(UserVO userVO) throws ClassNotFoundException, SQLException {
		
	    LOG.debug("┌──────────────────────────────┐");
	    LOG.debug("│setOtp                        │" + userVO.toString());
	    LOG.debug("└──────────────────────────────┘");
	    
	    // OTP의 범위를 100000부터 999999까지로 설정
	    int min = 100000;
	    int max = 999999;

	    Random random = new Random();
	    int otpNumber = random.nextInt(max - min + 1) + min;

	    userVO.setOtp(otpNumber);
	    // OtpDaoImpl 클래스의 setOtp 메서드 호출
	    String setOtpResult = otpDaoImpl.setOtp(userVO);
	    
	    // setOtpResult를 어떻게 사용할지는 코드 흐름에 따라 결정하시면 됩니다.

	    return String.valueOf(otpNumber);
	}

	@Override
	public String reSetOtp(UserVO userVO) throws Exception {
		
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│setOtp                        │" + userVO.toString());
		LOG.debug("└──────────────────────────────┘");
		
		String otp = "";
		
		otp = this.otpDaoImpl.reSetOtp(userVO);
		
		return otp;
	}

	 


}
