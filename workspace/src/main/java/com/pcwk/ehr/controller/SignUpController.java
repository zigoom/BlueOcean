package com.pcwk.ehr.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping(value = "/Termsofuse.do", method = RequestMethod.POST	)
	@ResponseBody
	public List<UserVO> Termsofuse(UserVO inVO, Model model) throws SQLException{
		List<UserVO> outVO = this.signUpService.doRetrieveTermsofuse(inVO);
		 
		LOG.debug("┌────────────────────────┐");
        LOG.debug("│Termsofuse Controller   │");
        LOG.debug("│vo                      │" + inVO);
        LOG.debug("└────────────────────────┘");
        
        //model.addAttribute(outVO);
        
		return outVO;
	}	
	
}
