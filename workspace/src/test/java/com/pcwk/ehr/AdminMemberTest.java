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
import com.pcwk.ehr.cmn.BookmarkVO;
import com.pcwk.ehr.dao.AdminMemberDao;
import com.pcwk.ehr.service.AdminMemberService;
import com.pcwk.ehr.service.BookmarkService;
import com.pcwk.ehr.service.NaverSearchService;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class) // 스프링 테스트 컨텍스 프레임워크의 JUnit확장 기능 지정
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" }) // 테스트 컨텍스트가 자동으로 만들어줄
																				// applicationContext 위치
@FixMethodOrder(MethodSorters.NAME_ASCENDING) // @Test 메소드를 오름차순으로 정렬한 순서대로 실행
public class AdminMemberTest {
	final Logger LOG = LogManager.getLogger(getClass());

	@Autowired
	AdminMemberService adminService;

	// 멤버 목록 불러오기
	@Test
	// @Ignore
	public void testLoadMember() throws SQLException {

		List<AdminPageVO> result = adminService.loadMember();
		LOG.debug("===result===:" + result);

	}

	// 멤버 목록 불러오기 (탈퇴여부 1또는 0인 유저)
	@Test
	@Ignore
	public void testLoadMemberOption() throws SQLException {
		AdminPageVO vo = new AdminPageVO();
		vo.setWithdrawal(1);
		List<AdminPageVO> result = adminService.loadMemberOption(vo);
		LOG.debug("===result===:" + result);

	}

	// 멤버 목록 불러오기 (아이디를 통해)
	@Test
	@Ignore
	public void testLoadMemberFromId() throws SQLException {
		AdminPageVO vo = new AdminPageVO();
		vo.setUserId("qwe");
		List<AdminPageVO> result = adminService.loadMemberFromId(vo);
		LOG.debug("===result===:" + result);

	}

	// 멤버 카운트
	@Test
	@Ignore
	public void testLoadMemberCount() throws SQLException {

		int result = adminService.loadMemberCount();
		LOG.debug("===result===:" + result);

	}

	// 멤버 카운트 (탈퇴여부 1또는 0인 유저)
	@Test
	@Ignore
	public void testLoadMemberCountOption() throws SQLException {
		AdminPageVO vo = new AdminPageVO();
		vo.setWithdrawal(0);
		int result = adminService.loadMemberCountOption(vo);
		LOG.debug("===result===:" + result);

	}

	// 회원 탈퇴
	@Test
	@Ignore
	public void testDeleteMember() throws SQLException {
		AdminPageVO vo = new AdminPageVO();
		vo.setUserId("qwe5");
		int result = adminService.deleteMember(vo);
		LOG.debug("===result===:" + result);

	}

	// 회원 복구
	@Test
	@Ignore
	public void testNotdeleteMember() throws SQLException {
		AdminPageVO vo = new AdminPageVO();
		vo.setUserId("qwe5");
		int result = adminService.notdeleteMember(vo);
		LOG.debug("===result===:" + result);

	}

}