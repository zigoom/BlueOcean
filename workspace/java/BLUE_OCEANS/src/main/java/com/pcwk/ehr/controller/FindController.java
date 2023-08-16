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
import com.pcwk.ehr.cmn.MessageVO;
import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.domain.UserVO;
import com.pcwk.ehr.service.FindService;



@Controller("FindController")
@RequestMapping("BLUEOCEAN")
public class FindController implements PcwkLogger{
	
	@Autowired
	FindService findService;
	
	public FindController() {
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│FindController                │");
		LOG.debug("└──────────────────────────────┘");
	}
	
	@RequestMapping(value = "/findId.do", method = RequestMethod.POST ,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String findId(UserVO user)throws SQLException, ClassNotFoundException {
		
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│FindController                │");
		LOG.debug("└──────────────────────────────┘");
		
		
		String foundId = findService.findId(user);
		return foundId; 
	

	}
	
	
	@RequestMapping(value = "/userCheck.do", method = RequestMethod.POST ,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int userCheck(UserVO user)throws SQLException, ClassNotFoundException {
		
		int flag = findService.reSetPasswd(user);
		
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│FindController                │");
		LOG.debug("└──────────────────────────────┘");
		
		
		
		return flag;
		
	}	
	
	@RequestMapping(value = "/reSet.do", method = RequestMethod.POST ,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int reSetPasswd(UserVO user)throws SQLException, ClassNotFoundException {
		
		int flag = findService.reSetPasswd(user);
		
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│FindController                │");
		LOG.debug("└──────────────────────────────┘");
		
		
		
		return flag;
		
	}		
}
