package com.pcwk.ehr;

import static org.junit.Assert.*;
import static org.mockito.Matchers.intThat;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.dao.LoginDao;
import com.pcwk.ehr.dao.OtpDao;
import com.pcwk.ehr.dao.SignUpDao;
import com.pcwk.ehr.domain.UserVO;
import com.pcwk.ehr.service.OtpService;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class) // 스프링 테스트 컨텍스 프레임워크의 JUnit확장 기능 지정
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" }) // 테스트 컨텍스트가 자동으로 만들어줄
																				// applicationContext 위치
@FixMethodOrder(MethodSorters.NAME_ASCENDING) // @Test 메소드를 오름차순으로 정렬한 순서대로 실행
public class MemberDaoTest implements PcwkLogger {

	@Autowired
	LoginDao loginDao;
	
	@Autowired
	SignUpDao singupDao;
	
	@Autowired
	OtpDao otpDao;
	
	@Autowired
	OtpService otpService;
	
	UserVO search;

	@Test
	@Ignore
	public void reseto() throws Exception {
	    UserVO userVO = new UserVO();
	    userVO.setUserId("qwe5");

	    String result = otpDao.reSetOtp(userVO);
	    
	    String otp = otpDao.selectOtp(userVO);
	    
	    assertNull(otp);
	}
	
	@Test
	
	public void setotp() throws Exception {
		UserVO userVO = new UserVO();
		userVO.setUserId("qwe5");
		
	    // OTP의 범위를 100000부터 999999까지로 설정
	    int min = 100000;
	    int max = 999999;

	    Random random = new Random();
	    int otpNumber = random.nextInt(max - min + 1) + min;
	    System.out.println("otpNumber : "+otpNumber);

	    userVO.setOtp(otpNumber);
	    // OtpDao.setOtp() 메서드 호출 시 userVO 객체를 전달합니다.
	    String result = otpDao.setOtp(userVO);
	    System.out.println("result : "+result);
	    String otp = otpDao.selectOtp(userVO);
	    int intotp = Integer.parseInt(otp);
	    System.out.println("otp : "+otp);
	    
	    int resultNumber = Integer.parseInt(result); // 문자열을 int로 변환
	    
	    
	    assertEquals(otpNumber, intotp);
		
		
	}
	

	@Test
	@Ignore
	public void sigup() throws SQLException, ClassNotFoundException {
		//search = new UserVO(0,"TEST","123","테스트","0000","123123",0,123123,"M","전자",0);
		//search = new UserVO(100,"qwe12332","123456","테스트",123456,"M","IT","naver.com","123-1231-2312",1,0);
		
		int result = singupDao.add(search);
		
		LOG.debug("===result===:" + result);
		assertEquals(result, 1);
		
	}
	
	@Test

	public void idchek() throws SQLException {
		UserVO userVO = new UserVO();
		userVO.setUserId("pcwk");
		
		int result = loginDao.idCheck(userVO);
		LOG.debug("===result===:" + result);
		assertEquals(result, 1);
	}
	
	//약관동의 insert
	@Test

	public void agree() throws Exception{
	    UserVO userVO = new UserVO();
	    userVO.setUserId("TEST");

	    int totalCount = singupDao.getTotalTermsOfUseCount();

	    int result = 0;
	    
	    for (int i = 1; i <= totalCount; i++) {
	        List<Integer> termsOfUseNos = new ArrayList<Integer>();
	        termsOfUseNos.add(i);

	        userVO.setTermsOfUse(termsOfUseNos);

	        result += singupDao.agree(userVO);
	    }


	    LOG.debug("===result===:" + result);
	    assertEquals(result, totalCount);
	}

	//카운트
	@Test
	
	public void getCount() {
		int result = singupDao.getTotalTermsOfUseCount();
		LOG.debug("===result===:" + result);
		assertEquals(result, 2);
	}

}
