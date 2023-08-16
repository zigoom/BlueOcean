package com.pcwk.ehr.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.domain.UserVO;
import com.pcwk.ehr.service.SignUpService;
@Controller("SignUpController")
@RequestMapping("BLUEOCEAN")
public class SignUpController implements PcwkLogger{
	
	@Autowired
	SignUpService signUpService;
	
	@RequestMapping(value = "/siginUp.do", method = RequestMethod.POST ,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String signUp(UserVO user)throws SQLException, ClassNotFoundException {
		
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│SiginUpController             │");
		LOG.debug("└──────────────────────────────┘");
		
		
		int flag = this.signUpService.add(user);
		System.out.println("***flag***"+flag);
		if (flag == 1) {

			return String.valueOf(flag);
		} else {
			return String.valueOf(flag);
		}
		
		
		
	
	}
	
	// 아이디 중복체크
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int idCheck(@RequestParam("id") String userId) throws Exception {

		LOG.debug("userId:" + userId);

		int cnt = this.signUpService.idCheck(userId);

		return cnt;

	}
	
}
