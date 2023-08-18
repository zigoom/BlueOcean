package com.pcwk.ehr.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.service.MyPageService;
import com.pcwk.ehr.cmn.BookmarkVO;
import com.pcwk.ehr.cmn.MyPageVO;

@Controller("MyPageController")
@RequestMapping("BLUEOCEAN")
public class MyPageController implements PcwkLogger {

	@Autowired
	private MyPageService myPageService;

	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public String mypageView(Model model, HttpSession session) {

		LOG.debug("┌─────────────────┐");
		LOG.debug("│ mypageView      │");
		LOG.debug("│ getAttribute : " + session.getAttribute("user"));
		LOG.debug("└─────────────────┘");

		String user = (String) session.getAttribute("user");

	
		LOG.debug("getAttribute : " + user);
	   	

		MyPageVO userInfo = myPageService.getMemberById(user); // 테스트용 사용자 아이디

		LOG.debug("userInfo - " + userInfo);
		model.addAttribute("userinfo", userInfo);

		return "main/mypage";
	}

	@RequestMapping(value = "/userUpdate.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody // JSON 형태의 응답을 반환하기 위해 필요
	public Map<String, String> userUpdate(@RequestBody MyPageVO myPageVO, HttpSession session) {
		LOG.debug("┌────────────────┐");
		LOG.debug("│ userUpdate     │");
		LOG.debug("└────────────────┘");
		System.out.println("mypageVO : " + myPageVO.toString());

		Map<String, String> resultMap = new HashMap<>();

		try {
			System.out.println();
			int flag = 0;
			flag = myPageService.userUpdate(myPageVO);
			if (flag == 1) {
				resultMap.put("result", "success"); // 성공 시 "success" 반환

			} else {
				resultMap.put("result", "failure"); // 실패 시 "failure" 반환
			}

		} catch (Exception e) {
			resultMap.put("result", "failure"); // 실패 시 "failure" 반환
		}

		return resultMap; // JSON 형태의 응답 데이터 반환
	}

	
	 @RequestMapping(value = "/withdraw.do", method = RequestMethod.POST
			 		,produces = "application/json;charset=UTF-8")
	 
	  @ResponseBody public Map<String, String> withdraw(@RequestBody MyPageVO
	  myPageVO , HttpSession session){ 
		LOG.debug("┌────────────────┐");
		LOG.debug("│ withdraw       │");
		LOG.debug("└────────────────┘");
	  
	  Map<String, String> resultMap = new HashMap<>();
	  
	  
	  try {
		   String userId = (String) session.getAttribute("user");
		   myPageVO.setUserId(userId);
	  
		   myPageService.withdraw(myPageVO);
		   resultMap.put("result", "success"); // 성공 시"success" 반환
		   
	        if(null!=session.getAttribute("user")) {
	            session.removeAttribute("user");
	            session.invalidate();
	            LOG.debug("=session.getAttribute(user)");
	        }
	  
	   }catch (Exception e) {
		   resultMap.put("result", "failure"); //실패 시 "failure" 반환
	   }
	  
	  return resultMap; }
	 

}
