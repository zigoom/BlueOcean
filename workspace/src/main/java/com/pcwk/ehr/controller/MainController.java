package com.pcwk.ehr.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pcwk.ehr.cmn.BookmarkVO;
import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.domain.MainVO;
import com.pcwk.ehr.service.BookmarkService;

@Controller("MainController")
@RequestMapping("BLUEOCEAN")
public class MainController implements PcwkLogger {

    @Autowired
    BookmarkService bookmarkService;
    
	@RequestMapping(value = "/main.do")
	public String mainView(MainVO inVO, Model model, HttpSession session) throws SQLException {		
		LOG.debug("┌────────────────┐");
		LOG.debug("│mainView        │");
		LOG.debug("│inVO            │"+inVO);
		LOG.debug("└────────────────┘");
				
		BookmarkVO outVO = new BookmarkVO();
		
		if (null != session.getAttribute("user")) {		
			outVO.setUserId((String) session.getAttribute("user"));		
			List<BookmarkVO> bookmarkList = bookmarkService.loadBookmark(outVO);
			model.addAttribute("bookmarkList", bookmarkList); 
		}
		
//		session.setAttribute("user", "pcwk");
//		vo.setUserId("pcwk");		
//    	List<BookmarkVO> outVO = bookmarkService.loadBookmark(vo);
//		for(int i = 0;i<outVO.size();i++) {
//		System.out.println("!!!!!!!!! - "+outVO.get(i).toString()); }		
//		model.addAttribute("bookmarkList", outVO); 				
		
		return "main/main";
	}
}
