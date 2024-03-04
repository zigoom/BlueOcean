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
import com.pcwk.ehr.service.AdminReplyService;

	@Controller("AdminReplyController")
	@RequestMapping("BLUEOCEAN/admin")
	public class AdminReplyController implements PcwkLogger{
		
		
		@Autowired
		AdminReplyService adminReplyService;
		
		
	@RequestMapping(value = "/reply.do", method = RequestMethod.GET)
	public String adminReplyView(Model model) throws SQLException  {
		LOG.debug("┌────────────────────┐");
		LOG.debug("│ AdminReplyContoller│");
		LOG.debug("└────────────────────┘");
		
		List<AdminPageVO> replyList = adminReplyService.loadReply();		
		model.addAttribute("replyList", replyList); 
		
			
		return "main/admin_reply";
	}
	
	@RequestMapping(value = "/loadReply.do", method = RequestMethod.POST)
	@ResponseBody
	public List<AdminPageVO> adminLoadReply() throws SQLException {
		List<AdminPageVO> replyList = adminReplyService.loadReply();

		return replyList;
	}
	
	@RequestMapping(value = "/loadReplyFromId.do", method = RequestMethod.POST)
	@ResponseBody
	public List<AdminPageVO> adminLoadReplyFromId(AdminPageVO vo) throws SQLException {
		List<AdminPageVO> idList = adminReplyService.loadReplyFromId(vo);

		return idList;
	}
	
	@RequestMapping(value = "/loadReplyOption.do", method = RequestMethod.POST)
	@ResponseBody
	public List<AdminPageVO> adminLoadReplyOption(AdminPageVO vo, Model model) throws SQLException {
		List<AdminPageVO> userReplyList = adminReplyService.loadReplyOption(vo);
		model.addAttribute("userReplyList", userReplyList);

		return userReplyList;
	}
	@RequestMapping(value = "/deleteReply.do", method = RequestMethod.POST)
	@ResponseBody
	public int adminDeleteMember(AdminPageVO vo) throws SQLException {
		int flag = adminReplyService.deleteReply(vo);

		return flag;
	}
	
	@RequestMapping(value = "/notDeleteReply.do", method = RequestMethod.POST)
	@ResponseBody
	public int adminNotDeleteReply(AdminPageVO vo) throws SQLException {
		int flag = adminReplyService.notdeleteReply(vo);

		return flag;
	}
	
	@RequestMapping(value = "/loadReplyCount.do", method = RequestMethod.POST)
	@ResponseBody
	public int adminLoadReplyCount() throws SQLException {
		int flag = adminReplyService.loadReplyCount();

		return flag;
	}


}
