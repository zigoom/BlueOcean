package com.pcwk.ehr.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pcwk.ehr.cmn.PcwkLogger;

@Controller("MainController")
@RequestMapping("main")
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
