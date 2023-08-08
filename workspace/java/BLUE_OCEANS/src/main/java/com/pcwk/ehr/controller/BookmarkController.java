package com.pcwk.ehr.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pcwk.ehr.cmn.BookmarkVO;
import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.domain.MainVO;
import com.pcwk.ehr.domain.UserVO;
import com.pcwk.ehr.service.BookmarkService;
import com.pcwk.ehr.service.NaverSearchService;

@Controller("BookmarkController")
@RequestMapping("BLUEOCEAN")
public class BookmarkController implements PcwkLogger {

	@Autowired
	NaverSearchService naverSearchService;

	@Autowired
	BookmarkService bookmarkService;

	@RequestMapping(value = "/bookmark.do")
	public String mainView(MainVO inVO) {

		System.out.println("┌────────────────┐");
		System.out.println("│bookmarkView    │");
		System.out.println("│inVO            │" + inVO);
		System.out.println("└────────────────┘");

		return "main/bookmark";
	}

	@RequestMapping(value = "/addBookmark.do")
	@ResponseBody
	public int addBookmark(BookmarkVO vo, Model model) throws SQLException {

	    int outVO = bookmarkService.addBookmark(vo);

	    System.out.println("┌────────────────┐");
	    System.out.println("│addBookmark     │");
	    System.out.println("│vo              │" + vo);
	    System.out.println("└────────────────┘");
	    model.addAttribute("bookmarkVO", outVO);

	    return outVO;
	}
	@RequestMapping(value = "/deleteBookmark.do")
	@ResponseBody
	public int deleteBookmark(BookmarkVO vo) throws SQLException {

	    int outVO = bookmarkService.deleteBookmark(vo);

	    System.out.println("┌────────────────┐");
	    System.out.println("│deleteBookmark  │");
	    System.out.println("│vo              │" + vo);
	    System.out.println("└────────────────┘");

	    return outVO;
	}

}
