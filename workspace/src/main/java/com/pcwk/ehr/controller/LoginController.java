 package com.pcwk.ehr.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.CookieGenerator;

import com.google.gson.Gson;
import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.MessageVO;
import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.domain.UserVO;
import com.pcwk.ehr.service.AdminLogService;
import com.pcwk.ehr.service.LoginService;

@Controller("LoginController")
@RequestMapping("BLUEOCEAN")
public class LoginController implements PcwkLogger {

	@Autowired
	LoginService loginService;

	@Autowired 
	AdminLogService adminLogService;
	
	public LoginController() {
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│LoginContoller                │");
		LOG.debug("└──────────────────────────────┘");
	}

	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session,UserVO user) throws SQLException {
		LOG.debug("┌───────────────┐");
		LOG.debug("│logout()       │");
		LOG.debug("└───────────────┘");

		
		if (null != session.getAttribute("user")) {
			AdminPageVO logVO = new AdminPageVO();
			String id = (String) session.getAttribute("user");
			logVO.setUserId(id);
			logVO.setLog1("로그아웃");

			logVO.setLog2("아이디 : " + id);

			adminLogService.addLog(logVO);
			
			
			session.removeAttribute("user");
			session.invalidate();
			LOG.debug("=session.getAttribute(user)");
		}
		return "main/main";

	}

	@RequestMapping(value = "/Login.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doLogin(UserVO user, HttpSession httpsession) throws SQLException, ClassNotFoundException {
		String jsonString = "";
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│inVO                          │" + user);

		MessageVO message = new MessageVO();

		// 1 : id미입력
		// 2 : 비번 미입력
		// 10 : 아이디 오류
		// 20 : 비번 오류
		// 30 : 성공

		int status = loginService.doLogin(user);
		if (30 == status) {
			message.setMsgId("30");
			message.setMsgContents(user.getUserId() + "로그인 되었습니다");

			

			// --------------------------------------------------
			// 사용자 정보 조회 : seesion처리
			// --------------------------------------------------
			UserVO userinfo = loginService.get(user);
			LOG.debug("sessthion" + userinfo);
			if (null != userinfo) {
				httpsession.setAttribute("user", userinfo.getUserId());
				httpsession.setAttribute("level", userinfo.getUserLevel());
				LOG.debug("-------------userinfo------------" + userinfo.getUserId());
				LOG.debug("-------------userinfo------------" + userinfo.getUserLevel());
				
				if (null != httpsession.getAttribute("user")) {
					AdminPageVO logVO = new AdminPageVO();
					String id = (String) httpsession.getAttribute("user");
					logVO.setUserId(id);
					logVO.setLog1("로그인");

					logVO.setLog2("아이디 : " + user.getUserId());

					adminLogService.addLog(logVO);
				}
				
			} else {
				message.setMsgId("99");
				message.setMsgContents("알수 없는 오류");
			}
		} else	if (40 == status) {
			message.setMsgId("40");
			message.setMsgContents("탈퇴된 회원 입니다");
		} else	if (10 == status || 20 == status) {
			message.setMsgId("0");
			message.setMsgContents("아이디를 또는 비밀번호를 확인 하세요");
		}

		jsonString = new Gson().toJson(message);
		LOG.debug("│jsonSting                     │" + jsonString);
		LOG.debug("└──────────────────────────────┘");

		return jsonString;
	}

}
