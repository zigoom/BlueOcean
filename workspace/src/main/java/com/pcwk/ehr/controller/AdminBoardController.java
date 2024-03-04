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
import com.pcwk.ehr.service.AdminBoardService;

@Controller("AdminBoardController")
@RequestMapping("BLUEOCEAN/admin")
public class AdminBoardController implements PcwkLogger {
	@Autowired
	AdminBoardService adminBoardService;

	@RequestMapping(value = "/board.do", method = RequestMethod.GET)
	public String adminBoardView(Model model) throws SQLException {
		List<AdminPageVO> boardList = adminBoardService.loadBoard();
		model.addAttribute("boardList", boardList);

		return "main/admin_board";
	}

	@RequestMapping(value = "/loadBoard.do", method = RequestMethod.POST)
	@ResponseBody
	public List<AdminPageVO> adminLoadBoard() throws SQLException {
		List<AdminPageVO> boardList = adminBoardService.loadBoard();

		return boardList;
	}

	@RequestMapping(value = "/loadBoardOption.do", method = RequestMethod.POST)
	@ResponseBody
	public List<AdminPageVO> adminLoadBoardOption(AdminPageVO vo, Model model) throws SQLException {
		List<AdminPageVO> boardList = adminBoardService.loadBoardOption(vo);
		model.addAttribute("boardList", boardList);

		return boardList;
	}

	@RequestMapping(value = "/loadBoardFromTitle.do", method = RequestMethod.POST)
	@ResponseBody
	public List<AdminPageVO> adminLoadBoardFromTitle(AdminPageVO vo) throws SQLException {
		List<AdminPageVO> idList = adminBoardService.loadBoardFromTitle(vo);

		return idList;
	}

	@RequestMapping(value = "/deleteBoard.do", method = RequestMethod.POST)
	@ResponseBody
	public int adminDeleteBoard(AdminPageVO vo) throws SQLException {
		int flag = adminBoardService.deleteBoard(vo);

		return flag;
	}

	@RequestMapping(value = "/notDeleteBoard.do", method = RequestMethod.POST)
	@ResponseBody
	public int adminNotDeleteBoard(AdminPageVO vo) throws SQLException {
		int flag = adminBoardService.notdeleteBoard(vo);

		return flag;
	}

	@RequestMapping(value = "/loadBoardCount.do", method = RequestMethod.POST)
	@ResponseBody
	public int adminLoadBoardCount() throws SQLException {
		int flag = adminBoardService.loadBoardCount();

		return flag;
	}

}
