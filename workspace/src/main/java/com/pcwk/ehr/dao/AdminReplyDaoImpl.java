package com.pcwk.ehr.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.PcwkLogger;

@Repository("AdminReplyDao")
public class AdminReplyDaoImpl implements AdminReplyDao, PcwkLogger {
	private static final String NAMESPACE = "com.pcwk.ehr.adminreplypage";
	final String DOT = ".";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate; // DB 연결객체
	
	public AdminReplyDaoImpl() {
	}
	
	@Override
	public List<AdminPageVO> loadReply() throws SQLException{
		List<AdminPageVO> outVO = new ArrayList<AdminPageVO>();
		System.out.println("│ AdminReplyDaoImpl-loadReply│");
		String statement = NAMESPACE + DOT + "loadReply";
		
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 1. statement-            │" + statement);
		LOG.debug("└──────────────────────────┘");
		outVO = this.sqlSessionTemplate.selectList(statement);
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 3. Check outVO           │" + outVO);
		LOG.debug("└──────────────────────────┘");

		return outVO;
	}
	@Override
	public List<AdminPageVO> loadReplyOption(AdminPageVO vo) throws SQLException {
		List<AdminPageVO> outVO = new ArrayList<AdminPageVO>();
		String statement = NAMESPACE + DOT + "loadReplyOption";
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 1. statement-            │" + statement);
		LOG.debug("└──────────────────────────┘");
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 2. param=\n              │" + vo.toString());
		LOG.debug("└──────────────────────────┘");
		outVO = this.sqlSessionTemplate.selectList(statement, vo);
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 3. Check outVO           │" + outVO);
		LOG.debug("└──────────────────────────┘");

		return outVO;
	}
	
	@Override
	public List<AdminPageVO> loadReplyFromId(AdminPageVO vo) throws SQLException {
		List<AdminPageVO> outVO = new ArrayList<AdminPageVO>();
		String statement = NAMESPACE + DOT + "loadReplyFromId";
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 1. statement-            │" + statement);
		LOG.debug("└──────────────────────────┘");
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 2. param=\n              │" + vo.toString());
		LOG.debug("└──────────────────────────┘");
		outVO = this.sqlSessionTemplate.selectList(statement, vo);
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 3. Check outVO           │" + outVO);
		LOG.debug("└──────────────────────────┘");

		return outVO;
	}


	@Override
	public int loadReplyCount() throws SQLException {
		int outVO = 0;
		String statement = NAMESPACE + DOT + "loadReplyCount";
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 1. statement-            │" + statement);
		LOG.debug("└──────────────────────────┘");
		outVO = this.sqlSessionTemplate.selectOne(statement);
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 3. Check outVO           │" + outVO);
		LOG.debug("└──────────────────────────┘");

		return outVO;
	}

	@Override
	public int loadReplyCountOption(AdminPageVO vo) throws SQLException {
		int outVO = 0;
		String statement = NAMESPACE + DOT + "loadReplyCountOption";
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 1. statement-            │" + statement);
		LOG.debug("└──────────────────────────┘");
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 2. param=\n              │" + vo.toString());
		LOG.debug("└──────────────────────────┘");
		outVO = this.sqlSessionTemplate.selectOne(statement, vo);
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 3. Check outVO           │" + outVO);
		LOG.debug("└──────────────────────────┘");

		return outVO;
	}

	@Override
	public int deleteReply(AdminPageVO vo) throws SQLException {
		int flag = 0;

		String statement = NAMESPACE + DOT + "deleteReply";
		// 로그 출력
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 1. statement-            │" + statement);
		LOG.debug("└──────────────────────────┘");
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 2. param=\n              │" + vo.toString());
		LOG.debug("└──────────────────────────┘");
		flag = this.sqlSessionTemplate.update(statement, vo);
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 3. Check flag            │" + flag);
		LOG.debug("└──────────────────────────┘");

		return flag;
	}

	@Override
	public int notdeleteReply(AdminPageVO vo) throws SQLException {
		int flag = 0;

		String statement = NAMESPACE + DOT + "notdeleteReply";
		// 로그 출력
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 1. statement-            │" + statement);
		LOG.debug("└──────────────────────────┘");
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 2. param=\n              │" + vo.toString());
		LOG.debug("└──────────────────────────┘");
		flag = this.sqlSessionTemplate.update(statement, vo);
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 3. Check flag            │" + flag);
		LOG.debug("└──────────────────────────┘");

		return flag;
	}
	

}
