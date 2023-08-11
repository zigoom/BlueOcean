package com.pcwk.ehr.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.service.MyPageService;
import com.pcwk.ehr.cmn.BookmarkVO;
import com.pcwk.ehr.cmn.MyPageVO;

@Controller("MyPageController")
@RequestMapping("BLUEOCEAN")
public class MyPageController implements PcwkLogger {
	
    @Autowired
    private MyPageService myPageService;
    
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public String mypageView(Model model, HttpSession session) {

		LOG.debug("┌────────────────┐");
		LOG.debug("│mypageView      │");
		LOG.debug("└────────────────┘");
		
		MyPageVO user = (MyPageVO) session.getAttribute("loggedInUser");
	    model.addAttribute("user", user);

		return "main/mypage";
	}
    
    
    @RequestMapping(value = "/info.do", method = RequestMethod.GET)
    public String showUserInfo(Model model, HttpSession session) {
		LOG.debug("┌────────────────┐");
		LOG.debug("│infoView        │");
		LOG.debug("└────────────────┘");
        MyPageVO user = (MyPageVO) session.getAttribute("loggedInUser");
        model.addAttribute("user", user);
        return "main/info";
    }
	
	
    @RequestMapping(value = "/update.do", method = RequestMethod.GET)
    public String userUpdate(HttpServletRequest request, HttpSession session) {
    	
		LOG.debug("┌────────────────┐");
		LOG.debug("│update          │");
		LOG.debug("└────────────────┘");






        return "main/mypage";
    }


}
