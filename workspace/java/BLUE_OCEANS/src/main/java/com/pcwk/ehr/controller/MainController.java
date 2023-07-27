package com.pcwk.ehr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.domain.MainVO;

@Controller("MainController")
@RequestMapping("BLUEOCEAN")
public class MainController implements PcwkLogger {

	
	@RequestMapping(value = "/main.do")
	public String mainView(MainVO inVO) {
		
		LOG.debug("┌────────────────┐");
		LOG.debug("│mainView        │");
		LOG.debug("│inVO            │"+inVO);
		LOG.debug("└────────────────┘");
		
		
		return "main/main";
	}
}