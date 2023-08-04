package com.pcwk.ehr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.domain.MainVO;
import com.pcwk.ehr.service.NaverSearchService;

@Controller("BookmarkController")
@RequestMapping("BLUEOCEAN")
public class BookmarkController implements PcwkLogger {

	@Autowired
	NaverSearchService naverSearchService;

	@RequestMapping(value = "/bookmark.do")
	public String mainView(MainVO inVO) {

		LOG.debug("┌────────────────┐");
		LOG.debug("│bookmarkView    │");
		LOG.debug("│inVO            │" + inVO);
		LOG.debug("└────────────────┘");

		return "main/bookmark";
	}
}
