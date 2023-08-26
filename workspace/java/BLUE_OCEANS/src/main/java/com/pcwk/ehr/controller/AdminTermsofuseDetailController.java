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
import com.pcwk.ehr.domain.BoardVO;
import com.pcwk.ehr.service.AdminTermsofuseDetailService;
import com.pcwk.ehr.service.AdminTermsofuseService;

@Controller("AdminTermsofuseDetailController")
@RequestMapping("BLUEOCEAN/admin")
public class AdminTermsofuseDetailController implements PcwkLogger{
	
	@Autowired
	AdminTermsofuseDetailService adminTermsofuseDetailService;
	
	@RequestMapping(value = "/termsofusedetail.do", method = RequestMethod.GET)
	public String adminTermsofusDetailView(Model model) throws SQLException{
		LOG.debug("┌────────────────────────────┐");
        LOG.debug("│adminTermsofuseDetailView   │");
        LOG.debug("└────────────────────────────┘");
        
  		//List<AdminPageVO> termsofuseDetailList = adminTermsofuseDetailService.loadTermsofuseDetail(inVO)();
  		//model.addAttribute("termsofuseDetailList", termsofuseDetailList); 
  		
        return "main/admin_termsofusedetail";
		
	}
	
	
	@RequestMapping(value = "/loadtermsofusedetail.do", method = RequestMethod.POST)
	public String loadTermsofuseDetail(AdminPageVO inVO, Model model, HttpSession session) throws SQLException{
		LOG.debug("┌────────────────────────────┐");
        LOG.debug("│loadTermsofuseDetail        │");
        LOG.debug("└────────────────────────────┘");
        
  		AdminPageVO outVO = adminTermsofuseDetailService.loadTermsofuseDetail(inVO);
		
		model.addAttribute("outVO", outVO);
		model.addAttribute("inVO", inVO);	
		
        return "main/admin_termsofusedetail";
	}
	

}
