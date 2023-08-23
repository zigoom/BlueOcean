package com.pcwk.ehr.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.BookmarkVO;
import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.domain.MainVO;
import com.pcwk.ehr.service.AdminLogService;
import com.pcwk.ehr.service.NaverSearchService;

@Controller("DetailController")
@RequestMapping("BLUEOCEAN")
public class DetailController implements PcwkLogger {

	@Autowired
	NaverSearchService naverSearchService;

	@Autowired
	AdminLogService adminLogService;

	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public String mainView(BookmarkVO inVO, Model model, HttpSession session) throws SQLException {

		LOG.debug("┌────────────────┐");
		LOG.debug("│detailView      │");
		LOG.debug("│inVO            │" + inVO);
		LOG.debug("└────────────────┘");

		if (null != session.getAttribute("user")) {
			AdminPageVO logVO = new AdminPageVO();
			String id = (String) session.getAttribute("user");
			logVO.setUserId(id);
			logVO.setLog1("상세페이지 이동");

			logVO.setLog2("주식 코드: " + inVO.getStockCode() + ", 주식 이름: " + inVO.getStockName());

			adminLogService.addLog(logVO);
		}

		model.addAttribute("inVO", inVO);

		return "main/detail";
	}

	/* keyword 를 파라미터로 받아서 네이버뉴스 api 호출 */
	@RequestMapping(value = "/doNaverSearch.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doNaverSearch(String keyword) throws IOException {
		String responseBody = "";
		responseBody = naverSearchService.doNaverSearch(keyword);
		return responseBody;

	}
}
