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
	public String adminTermsofusDetailView(AdminPageVO inVO, Model model) throws SQLException{
		LOG.debug("┌────────────────────────────┐");
        LOG.debug("│adminTermsofuseDetailView   │");
        LOG.debug("└────────────────────────────┘");
        
        AdminPageVO result = adminTermsofuseDetailService.loadTermsofuseDetail(inVO);
        model.addAttribute("result",result);
  		LOG.debug(result);
  		
        return "main/admin_termsofusedetail";
		
	}
	
	@RequestMapping(value = "/termsofuseUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public int termsofuseUpdate(AdminPageVO vo)throws SQLException{
		
		LOG.debug("┌────────────────────────────┐");
        LOG.debug("│termsofuseUpdate		    │");
        LOG.debug("└────────────────────────────┘");
        
		int flag = adminTermsofuseDetailService.termsofuseUpdate(vo);
		LOG.debug("flag"+flag);
		return flag;
	}
	
	
	@RequestMapping(value = "/termsofuseDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public int termsofuseDelete(AdminPageVO vo)throws SQLException{
		
		LOG.debug("┌────────────────────────────┐");
        LOG.debug("│termsofuseDelete		    │");
        LOG.debug("│vo						    │"+vo);
        LOG.debug("└────────────────────────────┘");
        
		int flag = adminTermsofuseDetailService.termsofuseDelete(vo);
		LOG.debug("flag : "+flag);
		return flag;
	}
	

	

}
