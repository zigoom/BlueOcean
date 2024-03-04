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
import com.pcwk.ehr.service.AdminLogService;

@Controller("AdminLogController")
@RequestMapping("BLUEOCEAN/admin")
public class AdminLogController implements PcwkLogger {
	@Autowired
	AdminLogService adminLogService;

	@RequestMapping(value = "/log.do", method = RequestMethod.GET)
	public String adminLogView(Model model) throws SQLException {
		List<AdminPageVO> LogList = adminLogService.loadLog();
		model.addAttribute("LogList", LogList);

		return "main/admin_log";
	}

	@RequestMapping(value = "/loadLog.do", method = RequestMethod.POST)
	@ResponseBody
	public List<AdminPageVO> adminLoadLog() throws SQLException {
		List<AdminPageVO> LogList = adminLogService.loadLog();

		return LogList;
	}

	@RequestMapping(value = "/loadLogCount.do", method = RequestMethod.POST)
	@ResponseBody
	public int adminLoadLogCount() throws SQLException {
		int flag = adminLogService.loadLogCount();

		return flag;
	}

	@RequestMapping(value = "/loadLogCountOption.do", method = RequestMethod.POST)
	@ResponseBody
	public int adminLoadLogCountOption(AdminPageVO vo) throws SQLException {
		int flag = adminLogService.loadLogCountOption(vo);
		return flag;

	}

	@RequestMapping(value = "/loadLogFromId.do", method = RequestMethod.POST)
	@ResponseBody
	public List<AdminPageVO> adminLoadLogFromId(AdminPageVO vo) throws SQLException {
		List<AdminPageVO> LogList = adminLogService.loadLogFromId(vo);

		return LogList;
	}

	@RequestMapping(value = "/loadLogOption.do", method = RequestMethod.POST)
	@ResponseBody
	public List<AdminPageVO> adminLoadLogOption(AdminPageVO vo) throws SQLException {
		List<AdminPageVO> LogList = adminLogService.loadLogOption(vo);

		return LogList;
	}

	@RequestMapping(value = "/loadLogOptionFromId.do", method = RequestMethod.POST)
	@ResponseBody
	public List<AdminPageVO> adminLoadLogOptionFromId(AdminPageVO vo) throws SQLException {
		List<AdminPageVO> LogList = adminLogService.loadLogOptionFromId(vo);

		return LogList;
	}

}
