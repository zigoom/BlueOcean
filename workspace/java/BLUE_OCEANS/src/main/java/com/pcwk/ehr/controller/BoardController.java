package com.pcwk.ehr.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.domain.CodeVO;
import com.pcwk.ehr.domain.BoardVO;
import com.pcwk.ehr.service.BoardService;
import com.pcwk.ehr.service.CodeService;

@Controller
@RequestMapping("/board")
public class BoardController implements PcwkLogger {

    @Autowired
    BoardService boardService;

    @Autowired
    CodeService codeService;

    


    
    //게시판 출력, 검색 기능, 페이징
	/**
	 * 게시목록(board_list.jsp) 데이터 전달
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping("/boardView.do")
	public String boardView(BoardVO inVO, Model model)throws SQLException{
		String viewPage = "board/board";
		System.out.println("boardView 컨트롤러");	
		System.out.println("no   : " + inVO.getPageNo());	
		System.out.println("word : " +  inVO.getSearchWord());
		
		
		//page 번호
		if(null != inVO && inVO.getPageNo()==0) {
			inVO.setPageNo(1);
		}
		
		//page 사이즈
		if(null != inVO && inVO.getPageSize()==0) {
			inVO.setPageSize(10);
		}
		
		//searchWord
		if(null != inVO && null == inVO.getSearchWord()) {
			inVO.setSearchWord("");
		}
		//searchDiv (제목으로 검색)
		//inVO.setSearchDiv("10");
		
		System.out.println("//코드조회 위에");
		
		
		//코드조회 : 검색코드
//		CodeVO codeVO = new CodeVO();
//		codeVO.setCodeId("BOARD_SEARCH");
//		List<CodeVO> searchList = codeService.doRetrieve(codeVO);
//		model.addAttribute("searchList", searchList);
		
		
		//코드조회 : 페이지 사이즈
//		CodeVO codeVO = new CodeVO();
//		codeVO.setCodeId("CMN_PAGE_SIZE");
//		List<CodeVO> pageSizeList = codeService.doRetrieve(codeVO);
//		model.addAttribute("pageSizeList", pageSizeList);
		
		
		List<BoardVO> list = this.boardService.doRetrieve(inVO);
		System.out.println("//코드조회 중간");
		model.addAttribute("boardList", list); 
		model.addAttribute("inVO",inVO);	
		
		
		System.out.println("boardList   : " + list);	
		System.out.println("inVO : " +  inVO);
		
		//총글수
		int totalCnt = 0;
		if(null != list && list.size() > 0 ) {
			totalCnt = list.get(0).getTotalCnt();
			System.out.println("totalCnt:"+totalCnt);
		}
			
		model.addAttribute("totalCnt", totalCnt);
		System.out.println("no   : " + inVO.getPageNo());
		System.out.println("현재 no는!!!   : " + inVO.getPageNo());
		System.out.println("//코드조회 아래");
		
		return viewPage;
		
	}

	
	@RequestMapping("/doMoveToReg.do")
	public String doMoveToReg(BoardVO inVO, Model model)throws SQLException{
		String view = "board/board_reg";
		LOG.debug("=================");
		LOG.debug("== doMoveToReg ==");
		LOG.debug("== inVO         =="+inVO);
		LOG.debug("=================");
		
		model.addAttribute("inVO", inVO);
		
		return view;
		
	}
	
	
}
