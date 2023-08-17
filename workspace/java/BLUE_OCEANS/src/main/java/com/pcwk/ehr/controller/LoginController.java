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
import com.pcwk.ehr.cmn.MessageVO;
import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.domain.UserVO;
import com.pcwk.ehr.service.LoginService;

@Controller("LoginController")
@RequestMapping("BLUEOCEAN")
public class LoginController implements PcwkLogger {

	@Autowired
	LoginService loginService;

	public LoginController() {
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│LoginContoller                │");
		LOG.debug("└──────────────────────────────┘");
	}

	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		LOG.debug("┌───────────────┐");
		LOG.debug("│logout()       │");
		LOG.debug("└───────────────┘");

		if (null != session.getAttribute("user")) {
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
		if (null == user.getUserId() || "".equals(user.getUserId())) {
			message.setMsgId("1");
			message.setMsgContents("아이디를 입력 하세요");

			return new Gson().toJson(message);
		}

		if (null == user.getPasswd() || "".equals(user.getPasswd())) {
			message.setMsgId("2");
			message.setMsgContents("비밀번호를 입력 하세요");
			return new Gson().toJson(message);
		}

		int status = loginService.doLogin(user);
		if (10 == status) {
			message.setMsgId("10");
			message.setMsgContents("아이디를 확인 하세요");
		} else if (20 == status) {
			message.setMsgId("20");
			message.setMsgContents("비밀번호를 확인 하세요");
		} else if (30 == status) {
			message.setMsgId("30");
			message.setMsgContents(user.getUserId() + "로그인 되었습니다");

			// --------------------------------------------------
			// 사용자 정보 조회 : seesion처리
			// --------------------------------------------------
			UserVO userinfo = loginService.get(user);
			LOG.debug("sessthion" + userinfo);
			if (null != userinfo) {
				httpsession.setAttribute("user", userinfo.getUserId());
				LOG.debug("-------------userinfo------------" + userinfo.getUserId());
			} else {
				message.setMsgId("99");
				message.setMsgContents("알수 없는 오류");
			}
		}

		jsonString = new Gson().toJson(message);
		LOG.debug("│jsonSting                     │" + jsonString);
		LOG.debug("└──────────────────────────────┘");

		return jsonString;
	}

}
