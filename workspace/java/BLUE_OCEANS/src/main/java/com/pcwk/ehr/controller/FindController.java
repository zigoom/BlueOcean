package com.pcwk.ehr.controller;


import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.MessageVO;
import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.domain.UserVO;
import com.pcwk.ehr.service.AdminLogService;
import com.pcwk.ehr.service.FindService;



@Controller("FindController")
@RequestMapping("BLUEOCEAN")
public class FindController implements PcwkLogger{
	
	@Autowired
	FindService findService;
	
	@Autowired 
	AdminLogService adminLogService;
	
	public FindController() {
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│FindController                │");
		LOG.debug("└──────────────────────────────┘");
	}
	
	@RequestMapping(value = "/findId.do", method = RequestMethod.POST ,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String findId(UserVO user, HttpSession session)throws SQLException, ClassNotFoundException {
		
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│FindController                │");
		LOG.debug("└──────────────────────────────┘");
		
		String foundId = findService.findId(user);
		
		if (null != session.getAttribute("user")) {
			AdminPageVO logVO = new AdminPageVO();
			String id = (String) session.getAttribute("user");
			logVO.setUserId(id);
			logVO.setLog1("아이디 찾기");

			logVO.setLog2("ID: " + user.getUserId());

			adminLogService.addLog(logVO);
		}
		
		return foundId; 
	

	}
	
		
}
