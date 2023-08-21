package com.pcwk.ehr.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.service.AdminMemberService;

@Controller("AdminMemberController")
@RequestMapping("BLUEOCEAN/admin")
public class AdminMemberController implements PcwkLogger {

	@Autowired
	AdminMemberService adminMemberService;

	@RequestMapping(value = "/user.do", method = RequestMethod.GET)
	public String adminMemberView(Model model) throws SQLException {
		List<AdminPageVO> userList = adminMemberService.loadMember();
		model.addAttribute("userList", userList);

		return "main/admin_user";
	}

	@RequestMapping(value = "/loadMember.do", method = RequestMethod.POST)
	@ResponseBody
	public List<AdminPageVO> adminLoadMember() throws SQLException {
		List<AdminPageVO> memberList = adminMemberService.loadMember();

		return memberList;
	}

	@RequestMapping(value = "/loadMemberOption.do", method = RequestMethod.POST)
	@ResponseBody
	public List<AdminPageVO> adminLoadMemberOption(AdminPageVO vo, Model model) throws SQLException {
		List<AdminPageVO> userList = adminMemberService.loadMemberOption(vo);
		model.addAttribute("userList", userList);

		return userList;
	}
	
	@RequestMapping(value = "/loadMemberFromId.do", method = RequestMethod.POST)
	@ResponseBody
	public List<AdminPageVO> adminLoadMemberFromId(AdminPageVO vo) throws SQLException {
		List<AdminPageVO> idList = adminMemberService.loadMemberFromId(vo);

		return idList;
	}
	
	@RequestMapping(value = "/deleteMember.do", method = RequestMethod.POST)
	@ResponseBody
	public int adminDeleteMember(AdminPageVO vo) throws SQLException {
		int flag = adminMemberService.deleteMember(vo);

		return flag;
	}
	
	@RequestMapping(value = "/notDeleteMember.do", method = RequestMethod.POST)
	@ResponseBody
	public int adminNotDeleteMember(AdminPageVO vo) throws SQLException {
		int flag = adminMemberService.notdeleteMember(vo);

		return flag;
	}
	
	@RequestMapping(value = "/loadMemberCount.do", method = RequestMethod.POST)
	@ResponseBody
	public int adminLoadMemberCount() throws SQLException {
		int flag = adminMemberService.loadMemberCount();

		return flag;
	}
	

}
