package com.pcwk.ehr.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pcwk.ehr.cmn.PcwkLogger;

@Controller("AdminController")
@RequestMapping("BLUEOCEAN/admin")
public class AdminController implements PcwkLogger {
	
	@RequestMapping(value = "/user.do", method = RequestMethod.GET)
	public String adminUserView() {

		return "main/admin_user";
	}
	
	@RequestMapping(value = "/board.do", method = RequestMethod.GET)
	public String adminBoardView() {

		return "main/admin_board";
	}
	
	@RequestMapping(value = "/reply.do", method = RequestMethod.GET)
	public String adminReplyView() {

		return "main/admin_reply";
	}
	
	@RequestMapping(value = "/termsofuse.do", method = RequestMethod.GET)
	public String adminTermsofuseView() {

		return "main/admin_termsofuse";
	}
	
	@RequestMapping(value = "/log.do", method = RequestMethod.GET)
	public String adminLogView() {

		return "main/admin_log";
	}
}
