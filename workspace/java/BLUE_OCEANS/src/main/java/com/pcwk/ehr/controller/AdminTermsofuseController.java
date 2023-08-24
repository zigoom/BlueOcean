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
        
        
        // page 번호
  		//if(null != inVO && inVO.getPageNo()==0) {
  		//	inVO.setPageNo(1);
  		//}
  		
  		//page 사이즈
  		//if(null != inVO && inVO.getPageSize()==0) {
  		//	inVO.setPageSize(10);
  		//}
  		
  		//searchWord
  		//if(null != inVO && null == inVO.getSearchWord()) {
  		//	inVO.setSearchWord("");
  		//}

  		//List<AdminPageVO> termsofuseList = adminTermsofuseService.doRetrieve(inVO);
  		
  		//model.addAttribute("termsofuseList", termsofuseList); 
  		  		//	System.out.println("totalCnt:"+totalCnt);
  		//}
  			
  		//model.addAttribute("totalCnt", totalCnt);
		

        return "main/admin_termsofuse";
		
	}
	
	@RequestMapping(value = "/admin/doRetrieveTermsofuse.do", method = RequestMethod.GET)
	@ResponseBody
	public List<AdminPageVO> doRetrieveTermsofuse(AdminPageVO inVO, Model model) throws SQLException{
		List<AdminPageVO> outVO = this.adminTermsofuseService.doRetrieveTermsofuse(inVO);
		
		LOG.debug("┌────────────────────────┐");
        LOG.debug("│doRetrieve Controller   │");
        LOG.debug("│vo                      │" + inVO);
        LOG.debug("└────────────────────────┘");
        
        model.addAttribute(outVO);
        
		return outVO;
	}
	

}
