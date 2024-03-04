package com.pcwk.ehr.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.PcwkLogger;

import com.pcwk.ehr.domain.SearchListVO;
import com.pcwk.ehr.domain.UserVO;
import com.pcwk.ehr.service.AdminLogService;

@Controller("SearchListController")
@RequestMapping("BLUEOCEAN")
public class SearchListController implements PcwkLogger {

	@Autowired 
	AdminLogService adminLogService;
	
	@RequestMapping(value = "/searchlist.do")
	public String searchListView(@RequestParam(name = "data") String encodedData, Model model, HttpSession session, UserVO user) throws UnsupportedEncodingException, SQLException {
		
		LOG.debug("┌────────────────┐");
		LOG.debug("│searchlist      │");
		LOG.debug("│inVO            │");
		LOG.debug("└────────────────┘");
		
        LOG.debug("Received encodedData:", encodedData);
        
        String decodedData = URLDecoder.decode(encodedData, "UTF-8");
        LOG.debug("Decoded data:", decodedData);

        // 원하는 데이터 처리 및 Model에 추가
        model.addAttribute("searchData", decodedData);
        
		if (null != session.getAttribute("user")) {
			AdminPageVO logVO = new AdminPageVO();
			String id = (String) session.getAttribute("user");
			logVO.setUserId(id);
			logVO.setLog1("검색창 검색어");

			logVO.setLog2("검색결과 리스트 페이지  : " + encodedData);

			adminLogService.addLog(logVO);
		}
		
		 
		return "main/searchlist";
	}
}
