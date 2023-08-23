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


@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class) // 스프링 테스트 컨텍스 프레임워크의 JUnit확장 기능 지정
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" }) // 테스트 컨텍스트가 자동으로 만들어줄
																				// applicationContext 위치
@FixMethodOrder(MethodSorters.NAME_ASCENDING) // @Test 메소드를 오름차순으로 정렬한 순서대로 실행
public class AdminBoardTest {
	final Logger LOG = LogManager.getLogger(getClass());

	@Autowired
	AdminBoardService adminService;

	// 보드 목록 불러오기
	@Test
	@Ignore
	public void testLoadBoard() throws SQLException {

		List<AdminPageVO> result = adminService.loadBoard();
		LOG.debug("===result===:" + result);

	}

	// 보드 목록 불러오기 (삭제여부 1또는 0인 유저)
	@Test
	@Ignore
	public void testLoadBoardOption() throws SQLException {
		AdminPageVO vo = new AdminPageVO();
		vo.setBoardDelete(1);
		List<AdminPageVO> result = adminService.loadBoardOption(vo);
		LOG.debug("===result===:" + result);

	}

	// 보드 목록 불러오기 (타이틀을 통해)
	@Test
	@Ignore
	public void testLoadBoardFromId() throws SQLException {
		AdminPageVO vo = new AdminPageVO();
		vo.setUserId("qwe");
		List<AdminPageVO> result = adminService.loadBoardFromTitle(vo);
		LOG.debug("===result===:" + result);

	}

	// 보드 카운트
	@Test
	@Ignore
	public void testLoadBoardCount() throws SQLException {

		int result = adminService.loadBoardCount();
		LOG.debug("===result===:" + result);

	}

	// 보드 카운트 (삭제여부 1또는 0인 유저)
	@Test
	@Ignore
	public void testLoadBoardCountOption() throws SQLException {
		AdminPageVO vo = new AdminPageVO();
		vo.setBoardDelete(0);
		int result = adminService.loadBoardCountOption(vo);
		LOG.debug("===result===:" + result);

	}

	// 보드 삭제
	@Test
	@Ignore
	public void testDeleteBoard() throws SQLException {
		AdminPageVO vo = new AdminPageVO();
		vo.setTitle("qwe5");
		int result = adminService.deleteBoard(vo);
		LOG.debug("===result===:" + result);

	}

	// 보드 복구
	@Test
	@Ignore
	public void testNotdeleteBoard() throws SQLException {
		AdminPageVO vo = new AdminPageVO();
		vo.setTitle("qwe5");
		int result = adminService.notdeleteBoard(vo);
		LOG.debug("===result===:" + result);

	}

}