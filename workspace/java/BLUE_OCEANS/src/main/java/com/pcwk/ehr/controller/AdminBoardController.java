package com.pcwk.ehr.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pcwk.ehr.cmn.PcwkLogger;

@Controller("AdminBoardController")
@RequestMapping("BLUEOCEAN/admin")
public class AdminBoardController implements PcwkLogger {

	@RequestMapping(value = "/board.do", method = RequestMethod.GET)
	public String adminBoardView() {

		return "main/admin_board";

	}
}