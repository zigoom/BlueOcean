package com.pcwk.ehr;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;
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

import com.pcwk.ehr.domain.UserVO;
import com.pcwk.ehr.domain.CodeVO;
import com.pcwk.ehr.domain.BoardVO;
import com.pcwk.ehr.service.BoardService;
import com.pcwk.ehr.service.CodeService;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class) // 스프링 테스트 컨텍스 프레임워크의 JUnit확장 기능 지정
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" }) // 테스트 컨텍스트가 자동으로 만들어줄
																				// applicationContext 위치
@FixMethodOrder(MethodSorters.NAME_ASCENDING) // @Test 메소드를 오름차순으로 정렬한 순서대로 실행
public class boardTest {
	final Logger LOG = LogManager.getLogger(getClass());

	@Autowired
	BoardService boardService;

	@Autowired
	CodeService codeService;

	
	
	// 게시판 글 조회 테스트
	@Test
	@Ignore
	public void testAddBoard() throws SQLException {
		
		BoardVO inVO = new BoardVO();
		
		inVO.setPageNo(1);
		inVO.setPageSize(10);
		inVO.setSearchWord("");
		
		List<BoardVO> list = this.boardService.doRetrieve(inVO);
		
		for(int i=0; i<list.size(); i++) {
			LOG.debug(list.get(i));
		}
		
	}
	
	
	
	// 글 등록 테스트
	@Test
	@Ignore
	public void testInsertBoard() throws SQLException {
		
		BoardVO inVO = new BoardVO();
		
		inVO.setUserId("asdf");
		inVO.setTitle("내 니 눈지 아니? 내 하얼빈 장첸이야!!!!!!");
		inVO.setContents("내 니 눈지 아니");
		
		int flag = boardService.doSave(inVO);
		
		if(1 == flag) {
			LOG.debug("데이터 넣기 성공성공성공");
		}else {
			LOG.debug("실패실패");
		}
		
		LOG.debug("flag 값은 : "+ flag);
		
		
	}
	

}















