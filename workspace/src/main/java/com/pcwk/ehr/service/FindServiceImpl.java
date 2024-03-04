package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.Random;

import org.apache.velocity.anakia.Escape;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.dao.FindDao;
import com.pcwk.ehr.domain.UserVO;

@Service
public class FindServiceImpl implements FindService, PcwkLogger {

	@Autowired
	FindDao findDao;
	
	@Autowired
    PasswordEncoder passwordEncoder;
	
	@Autowired
	JavaMailSender javaMailSender;

	public FindServiceImpl() {
	}
	
	
	
	@Override
	public UserVO resetPassWd(UserVO user) throws Exception {
		UserVO result = new UserVO();

		
		String inputPassword = user.getPasswd();
		UserVO seletepasswd = findDao.seletePasswd(user);
		
		if (seletepasswd != null && passwordEncoder.matches(inputPassword, seletepasswd.getPasswd())) {
			LOG.debug("사용중인 비밀번호");
			result.setOtp(0); // 값을 설정하여 1을 반환
		}else {
	        String encryptedPassword = passwordEncoder.encode(user.getPasswd());
	        user.setPasswd(encryptedPassword);
	        
			int resetpasswd = findDao.resetPassWd(user);
			
			LOG.debug("┌──────────────────────────┐");
			LOG.debug("│ resetpasswd              │" + resetpasswd);
			LOG.debug("└──────────────────────────┘");
			
			result.setOtp(1);
		}
		
		// 비밀번호 암호화

		
		return result;
	}		
	
	@Override
	public String checkOTP(UserVO user) throws Exception {
		// 1. 아이디 check
		// 2. 비번 check
		String foundId = "";

		int otp = findDao.checkOTP(user);
		 
		
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ otp                      │" + otp);
		LOG.debug("└──────────────────────────┘");
		
		int inputopt = user.getOtp();
		
		if (inputopt == otp) {
			LOG.debug("otp 비교 성공");
			foundId = "1";
			findDao.reSetOtp(user);
		} else {
			LOG.debug("otp 비교 실패");
			foundId = "2";
		}


		return foundId;
	}	

	@Override
	public String OTP(UserVO user) throws SQLException, ClassNotFoundException {
		// 1. 정상
		// 2. otp를 사용중이거나 일치하는 아이디없음
		String result = "";
		SimpleMailMessage message = new SimpleMailMessage();

		int otpusercheck = findDao.otpuserCheck(user);
		if (otpusercheck == 1) {
			LOG.debug("유저 확인");
			int usingotp = findDao.usingOTP(user);
			if (usingotp == 0) {
				LOG.debug("OTP 미사용중");
				int min = 100000;
				int max = 999999;

				Random random = new Random();

				int otp = random.nextInt(max - min + 1) + min;

				user.setOtp(otp);
				sendEmail(user);
				
				int setotp = findDao.setOtp(user);
				if (setotp == 1) {
					LOG.debug("OTP set설정");
					result = "1";
				} else {
					LOG.debug("OTP set오류");
					result = "2";
				}
			} else {
				LOG.debug("OTP 사용중");
				result = "3";
			}
		}else {
			LOG.debug("유저가 없음");
			result = "4";
		}

		return result;
	}
	
	public void sendEmail(UserVO user) {
	    SimpleMailMessage message = new SimpleMailMessage();
	    message.setFrom("je971002@naver.com");
	    message.setTo(user.getEmail());
	    message.setSubject("OTP번호");
	    message.setText("OTP 6자리 : "+user.getOtp());

	    javaMailSender.send(message);
	}

	@Override
	public String findId(UserVO user) throws SQLException, ClassNotFoundException {
		// 1. 아이디 check
		// 2. 비번 check
		String foundId = "";

		int flag = findDao.userCheck(user);
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ flag                     │" + flag);
		LOG.debug("└──────────────────────────┘");
		if (flag == 1) {
			foundId = findDao.findId(user);
		} else {
			foundId = "0";
		}

		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ foundId                  │" + foundId);
		LOG.debug("└──────────────────────────┘");

		return foundId;
	}

}
