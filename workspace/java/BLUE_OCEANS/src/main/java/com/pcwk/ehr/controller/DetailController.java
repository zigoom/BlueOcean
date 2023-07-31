package com.pcwk.ehr.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.domain.MainVO;
import com.pcwk.ehr.service.NaverSearchService;

@Controller("DetailController")
@RequestMapping("BLUEOCEAN")
public class DetailController implements PcwkLogger {

	@Autowired
	NaverSearchService naverSearchService;

	@RequestMapping(value = "/detail.do")
	public String mainView(MainVO inVO) {

		LOG.debug("┌────────────────┐");
		LOG.debug("│detailView      │");
		LOG.debug("│inVO            │" + inVO);
		LOG.debug("└────────────────┘");

		return "main/detail";
	}

	@RequestMapping(value = "/doNaverSearch.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doNaverSearch(String keyword) throws IOException {
		String responseBody = "";
		responseBody = naverSearchService.doNaverSearch(keyword);
		return responseBody;

	}
}
