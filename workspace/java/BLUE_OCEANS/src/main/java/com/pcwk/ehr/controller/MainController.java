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
		
		
		BookmarkVO vo = new BookmarkVO();
		
		if (null != session.getAttribute("user")) {		
			vo.setUserId((String) session.getAttribute("user"));		
			List<BookmarkVO> bookmarkList = bookmarkService.loadBookmark(vo);
			model.addAttribute("bookmarkList", bookmarkList); 
		}
		session.setAttribute("user", "pcwk");

		vo.setUserId("pcwk");		

    	List<BookmarkVO> outVO = bookmarkService.loadBookmark(vo);
		System.out.println("sdsd - "+outVO.size());
		System.out.println("!!!!!!!!! - "+outVO.get(0));
		/*
		 * for(int i = 0;i<bookmarkList.size();i++) {
		 * System.out.println("!!!!!!!!! - "+bookmarkList.get(i).toString()); }
		 */
		model.addAttribute("bookmarkList", outVO); 
		
		
		
		return "main/main";
	}
}
