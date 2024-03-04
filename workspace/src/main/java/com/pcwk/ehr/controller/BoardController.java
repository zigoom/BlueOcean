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

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.cmn.StringUtil;
import com.pcwk.ehr.domain.CodeVO;
import com.pcwk.ehr.domain.BoardVO;
import com.pcwk.ehr.service.AdminLogService;
import com.pcwk.ehr.service.BoardService;
import com.pcwk.ehr.service.CodeService;
import com.pcwk.ehr.service.ReplyService;
import com.pcwk.ehr.domain.UserVO;
import com.pcwk.ehr.domain.ReplyVO;
import java.util.List;

@Controller("BoardController")
@RequestMapping("BlueOcean")
public class BoardController implements PcwkLogger {

    @Autowired
    BoardService boardService;

    @Autowired
    CodeService codeService;

    @Autowired
    ReplyService replyService;
    
    @Autowired
    AdminLogService adminLogService;
    
    public BoardController() {}
    
    
    
    
    
    // 댓글 등록 컨트롤러
    @RequestMapping(value = "/doReplySave.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
	public String doSave(ReplyVO inVO, HttpSession session)throws SQLException{
		
		String jsonString = "";
		
		System.out.println("doReplySave 컨트롤러");
		
		String  userId = (String) session.getAttribute("user");
		
		
		System.out.println("userId : "+userId);
		
		inVO.setUserId(userId);
		
		LOG.debug("=================");
		LOG.debug("== doSave ==");
		LOG.debug("== inVO         =="+inVO);
		LOG.debug("=================");
		
		//내용 : 10
		if(null != inVO && inVO.getContents().equals("")) {
			return StringUtil.validMessageToJson("10", "내용을 입력하세요");
		}
		
		//서비스 호출
		int flag = this.replyService.doSave(inVO);
				
		String message = "";
		if(1==flag) { //등록 성공
			message = inVO.getContents()+"등록 성공";
			
			if (null != session.getAttribute("user")) {
				AdminPageVO logVO = new AdminPageVO();
				String id = (String) session.getAttribute("user");
				logVO.setUserId(id);
				logVO.setLog1("댓글  등록");

				logVO.setLog2("작성내용: " +inVO.getContents());

				adminLogService.addLog(logVO);
			}
			
		}else { //등록실패
			message = inVO.getContents()+"등록 실패!!!ㅠㅠ";
		}
		
		jsonString = StringUtil.validMessageToJson(flag+"", message);
		
		LOG.debug("|jsonString|"+jsonString);
		

		
		return jsonString;
		
	}
		
    
    




    
    // 댓글 삭제 버튼 컨트롤러
	@RequestMapping(value = "/doReplyDelete.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doDelete(ReplyVO inVO, HttpSession session)throws SQLException{
		String jsonString = "";
		
		LOG.debug("=================");
		LOG.debug("== doReplyDelete ==");
		LOG.debug("== inVO 의 값은       =="+inVO);
		LOG.debug("=================");
		
		//ReplyVO outVO = replyService.doSelectOne(inVO);
		int flag = replyService.doDelete(inVO);
		
		String message = "";
		
		if(1 == flag) { //삭제 성공
		message = inVO.getPostNo()+"삭제 성공";
		
		if (null != session.getAttribute("user")) {
			AdminPageVO logVO = new AdminPageVO();
			String id = (String) session.getAttribute("user");
			logVO.setUserId(id);
			logVO.setLog1("댓글 삭제");

			logVO.setLog2("삭제한 댓글번호: " + inVO.getCommentNo() + 
						  ", 내용: " + inVO.getContents());

			adminLogService.addLog(logVO);
		}
		}else {       //삭제 실패
	    message = inVO.getPostNo()+"삭제 실패";    	
		}
		
		jsonString = StringUtil.validMessageToJson(flag+"", message);
		
		LOG.debug("|jsonString |"      +jsonString);
		
		LOG.debug("== inVO 의 값은   =="+inVO);

		
		return jsonString;
		
	}
    
   

	
	
	
	// 글 수정 버튼 클릭 후 수정 버튼 컨트롤러 
	@RequestMapping(value = "/doReplyUpdate.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doUpdate(ReplyVO inVO,HttpSession session)throws SQLException{
		
		String jsonString = "";
		
		LOG.debug("=================");
		LOG.debug("== doReplyUpdate ==");
		LOG.debug("== inVO         =="+inVO);
		LOG.debug("=================");
		
		int flag = this.replyService.doUpdate(inVO);
		
		String message = "";
		if(1 == flag) {
			message = inVO.getContents()+"이 수정 되었습니다";
			
			if (null != session.getAttribute("user")) {
				AdminPageVO logVO = new AdminPageVO();
				String id = (String) session.getAttribute("user");
				logVO.setUserId(id);
				logVO.setLog1("댓글 수정");

				logVO.setLog2("수정한 댓글 번호: " + inVO.getCommentNo() +
						",  수정한 댓글 내용: " + inVO.getContents());

				adminLogService.addLog(logVO);
			}
			
		}else {
			message = "수정 실패";
		}
		
		jsonString = StringUtil.validMessageToJson(flag+"",  message);
		LOG.debug("|jsonString                 |"+jsonString);
		
		return jsonString;
	}
	
	
	
	
    
    
    //////////////////////////////////////////////////// 아래는 게시판 컨트롤러 ///////////////////////////////////////////////////////////////////
    
	
	
	
	
	// 게시판 글수정 버튼 클릭 컨트롤러
	@RequestMapping(value = "/doEdit.do", method = RequestMethod.GET)
	public String doEdit(BoardVO inVO, Model model)throws SQLException{
		String view = "main/board_edit_reg";
		
		LOG.debug(" 수정 버튼 클릭했습니다!! ");
		
		LOG.debug("=================");
		LOG.debug("== doUpdate ==");
		LOG.debug("== inVO         =="+inVO);
		LOG.debug("=================");
		
		BoardVO outVO = boardService.doSelectOne(inVO);
		LOG.debug("== outVO         =="+outVO);
		
		model.addAttribute("outVO", outVO);
		
		return view;
		
	}
	
	
	
	// 글 수정 버튼 클릭 후 수정 버튼 컨트롤러 
	@RequestMapping(value = "/doUpdate.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doUpdate(BoardVO inVO,HttpSession session)throws SQLException{
		
	String jsonString = "";
	
	LOG.debug("=================");
	LOG.debug("== doUpdate ==");
	LOG.debug("== inVO         =="+inVO);
	LOG.debug("=================");
	
	int flag = this.boardService.doUpdate(inVO);
	
	String message = "";
	if(1 == flag) {
		message = inVO.getTitle()+"이 수정 되었습니다";
		
		if (null != session.getAttribute("user")) {
			AdminPageVO logVO = new AdminPageVO();
			String id = (String) session.getAttribute("user");
			logVO.setUserId(id);
			logVO.setLog1("게시글 수정");

			logVO.setLog2("게시글 번호: " + inVO.getSeq() +
					      ", 제목: " + inVO.getTitle());

			adminLogService.addLog(logVO);
		}
		
	}else {
		message = "수정 실패";
	}
	
	jsonString = StringUtil.validMessageToJson(flag+"",  message);
	LOG.debug("|jsonString                 |"+jsonString);
	
	return jsonString;
			
	}
    
	
    
    // 상세 게시판 삭제 버튼 컨트롤러
	@RequestMapping(value = "/doDelete.do", method = RequestMethod.GET, 
							produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doDelete(BoardVO inVO , HttpSession session)throws SQLException{
		String jsonString = "";
		
		LOG.debug("=================");
		LOG.debug("== doDelete ==");
		LOG.debug("== inVO 의 값은       =="+inVO);
		LOG.debug("=================");
		
		BoardVO outVO = boardService.doSelectOne(inVO);
		int flag = boardService.doDelete(inVO);
		
		String message = "";
		
		if(1==flag) { //삭제 성공
			message = inVO.getSeq()+"삭제 성공";
			
			if (null != session.getAttribute("user")) {
				AdminPageVO logVO = new AdminPageVO();
				String id = (String) session.getAttribute("user");
				logVO.setUserId(id);
				logVO.setLog1("게시글 삭제");

				logVO.setLog2("삭제한 게시글 번호 : " + inVO.getSeq());

				adminLogService.addLog(logVO);
			}
			
		}else {       //삭제 실패
		    message = inVO.getSeq()+"삭제 실패";    	
		}
		
		jsonString = StringUtil.validMessageToJson(flag+"", message);
		LOG.debug("|jsonString |"      +jsonString);
		LOG.debug("== inVO 의 값은22222222222       =="+inVO);
		LOG.debug("== outVO 의 값은22222222222       =="+outVO);
		
		return jsonString;
				
	}
    
	
	
	// 게시판 게시물 클릭 컨트롤러 (상세조회)
	@RequestMapping("/doSelectOne.do")
	public String doSelectOne(BoardVO inVO, ReplyVO replyVO, Model model, HttpSession session)throws SQLException{
		String view = "main/board_detail";
		
		LOG.debug("doSelectOne 컨트롤 구역");
		
		LOG.debug("=================");
		LOG.debug("== doSelectOne ==");
		LOG.debug("== inVO         =="+inVO);
		LOG.debug("=================");

		String id = "";	
		if (null != session.getAttribute("user")) {
			id = (String)session.getAttribute("user");
		}
		System.out.println("id : "+id);
		System.out.println("inVO.getUserId() : "+inVO.getUserId());
		
		boolean flag = id.equals(inVO.getUserId());
		System.out.println("flag : "+flag);
		AdminPageVO logVO = new AdminPageVO();
		logVO.setUserId(id);
		logVO.setLog1("상세게시글 조회");

		logVO.setLog2("게시글 번호: " + inVO.getSeq());

		adminLogService.addLog(logVO);
		
		
		if(!flag) {
			boardService.doUpdateReadCnt(inVO);
		}
		
		// 게시물의 일련번호를 가져와서 댓글 VO에 해당 게시물 번호를 설정한다.
		// inVO에서 getSeq로 번호를 가져오고, 가져온 값을 replyVO에 setPostNo에 값으로 설정한다?? 
		replyVO.setPostNo(inVO.getSeq());
		
		System.out.println("replyVO 값은 : " + replyVO);
		
		
		//댓글 상세조회
		List<ReplyVO> replyList = replyService.doRetrieve(replyVO);
		 
		model.addAttribute("replyList", replyList);
		 
		//등록자 ID를 Session에서 추출
//		UserVO userVO = (UserVO) httpSession.getAttribute("user");
//		inVO.setUserId(userVO.getUserId());		
		
		BoardVO outVO = boardService.doSelectOne(inVO);
		
		model.addAttribute("outVO", outVO);
		model.addAttribute("inVO", inVO);	
		
		return view;

	}
    
    

    
    //게시판 출력, 검색 기능, 페이징   doRetrieve
	/**
	 * 게시목록(board_list.jsp) 데이터 전달
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping("/boardView.do")
	public String boardView(BoardVO inVO, Model model)throws SQLException{
		String viewPage = "main/board";
		System.out.println("boardView 컨트롤러");	

		
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
		
		//총글수
		int totalCnt = 0;
		if(null != list && list.size() > 0 ) {
			totalCnt = list.get(0).getTotalCnt();
			System.out.println("totalCnt:"+totalCnt);
		}
			
		model.addAttribute("totalCnt", totalCnt);
		
		return viewPage;
		
	}

	
	
	// 글쓰기 버튼 
	@RequestMapping("/doMoveToReg.do")
	public String doMoveToReg(BoardVO inVO, Model model,HttpSession session)throws SQLException{
		String view = "main/board_reg";
		LOG.debug(" 글쓰기 버튼 클릭했습니다!! ");
		
		LOG.debug("=================");
		LOG.debug("== doMoveToReg ==");
		LOG.debug("== inVO         =="+inVO);
		LOG.debug("=================");
		
		model.addAttribute("inVO", inVO);
		if (null != session.getAttribute("user")) {
			AdminPageVO logVO = new AdminPageVO();
			String id = (String) session.getAttribute("user");
			logVO.setUserId(id);
			logVO.setLog1("글 작성페이지 이동");

			logVO.setLog2("이동");

			adminLogService.addLog(logVO);
		}
		
		return view;
		
	}
	
	
	
	// 글쓰기 버튼 , 저장 기능
	@RequestMapping(value = "/doSave.do", method = RequestMethod.POST
			,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doSave(BoardVO inVO, HttpSession session)throws SQLException{
		String jsonString = "";
		
		System.out.println("doSave 컨트롤러");
		
		String  userId = (String) session.getAttribute("user");
		
		System.out.println("userId : "+userId);
		
		inVO.setUserId(userId);
		
		LOG.debug("=================");
		LOG.debug("== doSave ==");
		LOG.debug("== inVO         =="+inVO);
		LOG.debug("=================");
		
		// 제목 : 10
		if(null != inVO && inVO.getTitle().equals("")) {
		    return StringUtil.validMessageToJson("10", "제목을 입력하세요");
		}

		
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
		
		if (null != session.getAttribute("user")) {
			AdminPageVO logVO = new AdminPageVO();
			String id = (String) session.getAttribute("user");
			logVO.setUserId(id);
			logVO.setLog1("글 등록");

			logVO.setLog2("등록한 글제목: " + inVO.getTitle());

			adminLogService.addLog(logVO);
		}
		
		return jsonString;
		
	}
	
}
