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
@RequestMapping("BLUEOCEAN")
public class AdminTermsofuseController implements PcwkLogger{
	
	@Autowired
	AdminTermsofuseService adminTermsofuseService;
	
	@RequestMapping(value = "/admin/termsofuse.do", method = RequestMethod.GET)
	public String adminTersofuseView(AdminPageVO inVO, Model model, HttpSession session) throws SQLException{
		LOG.debug("┌──────────────────────┐");
        LOG.debug("│mainTersofuse View    │");
        LOG.debug("│vo                    │" + inVO);
        LOG.debug("└──────────────────────┘");
        
        //List<AdminPageVO> termsofuseList = adminTermsofuseService.doRetrieve(inVO);
        //model.addAttribute("termsofuseList", termsofuseList);
        
        return "main/admin_termsofuse";
		
	}
	
	@RequestMapping(value = "/admin/testss.do", method = RequestMethod.GET)
	@ResponseBody
	public List<AdminPageVO> doRetrieve(AdminPageVO inVO, Model model) throws SQLException{
		List<AdminPageVO> outVO = this.adminTermsofuseService.doRetrieve(inVO);
		
		LOG.debug("┌────────────────────────┐");
        LOG.debug("│doRetrieve Controller   │");
        LOG.debug("│vo                      │" + inVO);
        LOG.debug("└────────────────────────┘");
        
        model.addAttribute(outVO);
        
		return outVO;
	}
	

}
