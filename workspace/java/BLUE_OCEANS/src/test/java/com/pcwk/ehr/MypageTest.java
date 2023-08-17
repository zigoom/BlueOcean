package com.pcwk.ehr;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
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

import com.pcwk.ehr.cmn.MyPageVO;
import com.pcwk.ehr.service.MyPageService;
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)  //스프링 테스트 컨텍스 프레임워크의 JUnit확장 기능 지정
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
                                  ,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"	})
@FixMethodOrder(MethodSorters.NAME_ASCENDING) // @Test 메소드를 오름차순으로 정렬한 순서대로 실행
public class MypageTest {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	MyPageService mypageService;
	



	
	//회원정보 출력 테스트
	@Test
	@Ignore
	public void mypageViewTest () throws SQLException {
		
		String userId = "pcwk";
		MyPageVO mypageVO = new MyPageVO();
		mypageVO.setUserId(userId);
		
		MyPageVO resultUser = mypageService.getMemberById(userId);
	
        
        LOG.debug("resultUser : "+resultUser);

	}
	
	//회원정보 수정 테스트
	@Test
	@Ignore
	public void userUpdateTest () throws SQLException{
		String userId = "pcwk";
		MyPageVO user = mypageService.getMemberById(userId);
		
		user.setPhoneNo("111-1111-1111");
		user.setBirthday(000000);
		user.setGender("M");
		user.setEmail("test@test.com");
		user.setKeyword("zip");
		
		int result = mypageService.userUpdate(user);
		assertEquals(1,result);
		
	}
	@Test
	public void withdraw()throws SQLException{
		
		String userId = "pcwk";
		MyPageVO user = mypageService.getMemberById(userId);
		
		int result = mypageService.withdraw(user);
		assertEquals(1,result);
	}

}
