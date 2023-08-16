package com.pcwk.ehr.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pcwk.ehr.cmn.PcwkLogger;

import com.pcwk.ehr.domain.SearchListVO;

@Controller("SearchListController")
@RequestMapping("BLUEOCEAN")
public class SearchListController implements PcwkLogger {

	
	@RequestMapping(value = "/searchlist.do")
	public String searchListView(@RequestParam(name = "data") String encodedData, Model model) throws UnsupportedEncodingException {
		
		LOG.debug("┌────────────────┐");
		LOG.debug("│searchlist      │");
		LOG.debug("│inVO            │");
		LOG.debug("└────────────────┘");
		
        LOG.debug("Received encodedData:", encodedData);
        
        String decodedData = URLDecoder.decode(encodedData, "UTF-8");
        LOG.debug("Decoded data:", decodedData);

        // 원하는 데이터 처리 및 Model에 추가
        model.addAttribute("searchData", decodedData);
		
		
		return "main/searchlist";
	}
}
