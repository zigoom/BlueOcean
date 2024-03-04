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

import com.pcwk.ehr.cmn.BookmarkVO;
import com.pcwk.ehr.service.BookmarkService;
import com.pcwk.ehr.service.NaverSearchService;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class) // 스프링 테스트 컨텍스 프레임워크의 JUnit확장 기능 지정
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" }) // 테스트 컨텍스트가 자동으로 만들어줄
																				// applicationContext 위치
@FixMethodOrder(MethodSorters.NAME_ASCENDING) // @Test 메소드를 오름차순으로 정렬한 순서대로 실행
public class BookmarkTest {
	final Logger LOG = LogManager.getLogger(getClass());

	@Autowired
	BookmarkService bookmarkService;

	@Autowired
	NaverSearchService naverSearchService;

	// 북마크 추가 테스트코드
	@Test
	@Ignore
	public void testAddBookmark() throws SQLException {
		BookmarkVO bookmarkVO = new BookmarkVO();
		bookmarkVO.setUserId("test1231");
		bookmarkVO.setStockCode("005930");
		bookmarkVO.setStockName("삼성전자");

		int result = bookmarkService.addBookmark(bookmarkVO);
		LOG.debug("===result===:" + result);
		if(result == 1) {
			LOG.debug("등록성공");
		}else if(result == 3) {
			LOG.debug("중복되는종목");
		}
	}

	// 북마크 삭제 테스트코드
	@Test
	@Ignore
	public void testDeleteBookmark() throws SQLException {
		BookmarkVO bookmarkVO = new BookmarkVO();
		bookmarkVO.setUserId("test1231");
		bookmarkVO.setStockCode("005930");
		bookmarkVO.setStockName("삼성전자");

		int result = bookmarkService.deleteBookmark(bookmarkVO);
		LOG.debug("===result===:" + result);
		assertEquals(result, 1);
		if(result == 0) {
			LOG.debug("해당 종목이 없습니다");
		}
	}

	// 북마크 카운트 테스트코드
	@Test
	@Ignore
	public void testCountBookmark() throws SQLException {
		BookmarkVO bookmarkVO = new BookmarkVO();
		bookmarkVO.setUserId("test1231");

		int result = bookmarkService.countBookmark(bookmarkVO);
		LOG.debug("===result===:" + result);
	}

	@Test
	@Ignore
	// 북마크 체크 테스트코드 (현재 이 북마크를 가지고 있는지 확인)
	public void testCheckBookmark() throws SQLException {
		BookmarkVO bookmarkVO = new BookmarkVO();
		bookmarkVO.setUserId("test1231");
		bookmarkVO.setStockCode("005930");

		int result = bookmarkService.checkBookmark(bookmarkVO);
		LOG.debug("===result===:" + result);
		assertEquals(result, 1);
		if(result == 0) {
			LOG.debug("해당 종목이 없습니다");
		}
	}

	@Test
	@Ignore
	// 가지고있는 북마크 불러오는 테스트코드
	public void testLoadBookmark() throws SQLException {
		BookmarkVO bookmarkVO = new BookmarkVO();
		bookmarkVO.setUserId("test1231");

		List<BookmarkVO> result = bookmarkService.loadBookmark(bookmarkVO);
		LOG.debug("===result===:" + result);
	}

	@Test
	@Ignore
	// 네이버 API 테스트코드
	public void testDoNaverSearch() throws SQLException, IOException {
		String result = naverSearchService.doNaverSearch("삼성");
		LOG.debug("===result===:" + result);
	}
}