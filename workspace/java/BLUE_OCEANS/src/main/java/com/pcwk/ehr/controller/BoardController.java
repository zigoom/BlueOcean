package com.pcwk.ehr.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.cmn.StringUtil;
import com.pcwk.ehr.domain.CodeVO;
import com.pcwk.ehr.domain.BoardVO;
import com.pcwk.ehr.service.BoardService;
import com.pcwk.ehr.service.CodeService;
import com.pcwk.ehr.domain.UserVO;

@Controller("BoardController")
@RequestMapping("BLUEOCEAN")
public class BoardController implements PcwkLogger {

    @Autowired
    BoardService boardService;

    @Autowired
    CodeService codeService;

    

	@RequestMapping("/doSelectOne.do")
	public String doSelectOne(BoardVO inVO, Model model, HttpSession httpSession)throws SQLException{
		String view = "main/board_mng";
		
		LOG.debug("=================");
		LOG.debug("== doSelectOne ==");
		LOG.debug("== inVO         =="+inVO);
		LOG.debug("=================");
		
		
		//등록자 ID를 Session에서 추출
		
		UserVO userVO = (UserVO) httpSession.getAttribute("user");
		
		System.out.println("doSelectOne 컨트롤러");	
		inVO.setModId(userVO.getUserId());
		
		BoardVO outVO = boardService.doSelectOne(inVO);
		model.addAttribute("outVO", outVO);
		model.addAttribute("inVO", inVO);

		return view;
		
	}
    
    

    
    //게시판 출력, 검색 기능, 페이징
	/**
	 * 게시목록(board_list.jsp) 데이터 전달
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping("/boardView.do")
	public String boardView(BoardVO inVO, Model model)throws SQLException{
		String viewPage = "main/board";
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


		List<BoardVO> list = this.boardService.doRetrieve(inVO);
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
		String view = "main/board_reg";
		LOG.debug("=================");
		LOG.debug("== doMoveToReg ==");
		LOG.debug("== inVO         =="+inVO);
		LOG.debug("=================");
		
		model.addAttribute("inVO", inVO);
		
		return view;
		
	}
	
	
	
	
	@RequestMapping(value = "/doSave.do", method = RequestMethod.POST
			,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doSave(BoardVO inVO)throws SQLException{
		String jsonString = "";
		LOG.debug("=================");
		LOG.debug("== doSave ==");
		LOG.debug("== inVO         =="+inVO);
		LOG.debug("=================");
		
		// 제목 : 10
		if(null != inVO && inVO.getTitle().equals("")) {
		    return StringUtil.validMessageToJson("10", "제목을 입력하세요");
		}
//		// 등록자 : 20
//		if(null != inVO && inVO.getRegId().equals("")) {
//		    return StringUtil.validMessageToJson("20", "등록자를 입력하세요");
//		}
		
		//내용 : 30
		if(null != inVO && inVO.getContents().equals("")) {
			return StringUtil.validMessageToJson("30", "내용을 입력하세요");
		}
		
		//서비스 호출
		int flag = this.boardService.doSave(inVO);
		
		String message = "";
		if(1==flag) { //등록 성공
			message = inVO.getTitle()+"등록 성공";
			
		}else { //등록실패
			message = inVO.getTitle()+"등록 실패!!!ㅠㅠ";
		}
		
		jsonString = StringUtil.validMessageToJson(flag+"", message);
		LOG.debug("|jsonString|"+jsonString);
		return jsonString;
		
	}
	
}
