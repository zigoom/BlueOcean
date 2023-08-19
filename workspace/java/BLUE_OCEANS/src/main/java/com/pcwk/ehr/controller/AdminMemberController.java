package com.pcwk.ehr.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pcwk.ehr.cmn.PcwkLogger;

@Controller("AdminMemberController")
@RequestMapping("BLUEOCEAN/admin")
public class AdminMemberController implements PcwkLogger {
	
	@RequestMapping(value = "/user.do", method = RequestMethod.GET)
	public String adminUserView() {

		return "main/admin_user";
	}
}
