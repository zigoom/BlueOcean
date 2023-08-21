package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.dao.AdminReplyDao;

@Service("AdminReplyService")
public class AdminReplyServiceImpl implements AdminReplyService, PcwkLogger {

	@Autowired
	private AdminReplyDao replyDao;
	
	@Override
	public List<AdminPageVO> loadReply() throws SQLException {
		System.out.println("│ AdminReplyServiceImpl-loadReply│");
		return replyDao.loadReply();
	}

	@Override
	public List<AdminPageVO> loadReplyOption(AdminPageVO vo) throws SQLException {
		System.out.println("│ AdminReplyServiceImpl-loaddReplyOption│");
		return replyDao.loadReplyOption(vo);
	}

	@Override
	public List<AdminPageVO> loadReplyFromId(AdminPageVO vo) throws SQLException {
		System.out.println("│ AdminReplyServiceImpl-loaddReplyFromId│");
		return replyDao.loadReplyFromId(vo);
	}

	@Override
	public int loadReplyCount() throws SQLException {
		System.out.println("│ AdminReplyServiceImpl-loadMemberCount│");
		return replyDao.loadReplyCount();
	}

	@Override
	public int loadReplyCountOption(AdminPageVO vo) throws SQLException {
		System.out.println("│ AdminReplyServiceImpl-loaddReplyCountOption│");
		return replyDao.loadReplyCountOption(vo);
	}

	@Override
	public int deleteReply(AdminPageVO vo) throws SQLException {
		System.out.println("│ AdminReplyServiceImpl-deletedReply│");
		return replyDao.deleteReply(vo);
	}

	@Override
	public int notdeleteReply(AdminPageVO vo) throws SQLException {
		System.out.println("│ AdminReplyServiceImpl-notdeletedReply│");
		return replyDao.notdeleteReply(vo);
	}
	
}
