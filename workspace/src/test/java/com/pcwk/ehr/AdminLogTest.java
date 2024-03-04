package com.pcwk.ehr;

import static org.junit.Assert.assertEquals;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.FixMethodOrder;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.service.AdminBoardService;
import com.pcwk.ehr.service.AdminLogService;


@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class) // 스프링 테스트 컨텍스 프레임워크의 JUnit확장 기능 지정
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" }) // 테스트 컨텍스트가 자동으로 만들어줄
																				// applicationContext 위치
@FixMethodOrder(MethodSorters.NAME_ASCENDING) // @Test 메소드를 오름차순으로 정렬한 순서대로 실행
public class AdminLogTest {
	final Logger LOG = LogManager.getLogger(getClass());

	@Autowired
	AdminLogService adminService;
	
	@Test
	@Ignore
	public void testAddLog() throws SQLException{
		AdminPageVO vo = new AdminPageVO();
		vo.setUserId("admin");
		vo.setLog1("메인페이지");
		vo.setLog2("이동");
		
		int result = adminService.addLog(vo);
		LOG.debug("===result===:" + result);
	}
	
	@Test
	@Ignore
	public void testloadLog() throws SQLException{
		List<AdminPageVO> result = adminService.loadLog();
		LOG.debug("===result===:" + result);
	}
	
	@Test
	public void testloadLogOption() throws SQLException{
		AdminPageVO vo = new AdminPageVO();
		vo.setStartDate("2023-08-05");
		vo.setEndDate("2023-08-15");
		List<AdminPageVO> result = adminService.loadLogOption(vo);
		LOG.debug("===result===:" + result);
	}

}