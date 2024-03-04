package com.pcwk.ehr.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.service.AdminTermsofuseService;

@Controller("AdminTermsofuseController")
@RequestMapping("BLUEOCEAN/admin")
public class AdminTermsofuseController implements PcwkLogger{
	
	@Autowired
	AdminTermsofuseService adminTermsofuseService;
	
	@RequestMapping(value = "/termsofuse.do", method = RequestMethod.GET)
	public String adminTermsofuseView(Model model) throws SQLException{
		LOG.debug("┌──────────────────────┐");
        LOG.debug("│adminTermsofuseView   │");
        LOG.debug("└──────────────────────┘");
        
  		List<AdminPageVO> termsofuseList = adminTermsofuseService.loadtermsofuse();
  		model.addAttribute("termsofuseList", termsofuseList); 
  		
        return "main/admin_termsofuse";
		
	}
	
	
	@RequestMapping(value = "/loadtermsofuse.do", method = RequestMethod.POST)
	@ResponseBody
	public List<AdminPageVO> loadTermsofuse() throws SQLException{
		LOG.debug("┌──────────────────────┐");
        LOG.debug("│loadTermsofuse        │");
        LOG.debug("└──────────────────────┘");
        
  		List<AdminPageVO> termsofuseList = adminTermsofuseService.loadtermsofuse();
  		
        return termsofuseList;
	}
	

}
