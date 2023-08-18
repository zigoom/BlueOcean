package com.pcwk.ehr.service;

import java.sql.SQLException;
import org.springframework.stereotype.Service;
import com.pcwk.ehr.domain.UserVO;


@Service
public interface OtpService {
	 
	//otp 설정
	public String setOtp(UserVO userVO) throws ClassNotFoundException, SQLException;

	//otp 초기화
	public String reSetOtp(UserVO userVO) throws Exception;
}
