package com.pcwk.ehr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.domain.MainVO;

@Controller("DetailController")
@RequestMapping("BLUEOCEAN")
public class DetailController implements PcwkLogger {

	@RequestMapping(value = "/detail.do")
	public String mainView(MainVO inVO) {

		LOG.debug("┌────────────────┐");
		LOG.debug("│detailView      │");
		LOG.debug("│inVO            │" + inVO);
		LOG.debug("└────────────────┘");

		return "main/detail";
	}
}
