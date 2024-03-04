package com.pcwk.ehr.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.PcwkLogger;

@Repository("AdminBoardDao")
public class AdminBoardDaoImpl implements AdminBoardDao, PcwkLogger {
	private static final String NAMESPACE = "com.pcwk.ehr.adminboardpage";
	final String DOT = ".";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate; // DB 연결객체

	public AdminBoardDaoImpl() {
	}

	@Override
	public List<AdminPageVO> loadBoard() throws SQLException {
		List<AdminPageVO> outVO = new ArrayList<AdminPageVO>();
		String statement = NAMESPACE + DOT + "loadBoard";
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
	public List<AdminPageVO> loadBoardOption(AdminPageVO vo) throws SQLException {
		List<AdminPageVO> outVO = new ArrayList<AdminPageVO>();
		String statement = NAMESPACE + DOT + "loadBoardOption";
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
	public List<AdminPageVO> loadBoardFromTitle(AdminPageVO vo) throws SQLException {
		List<AdminPageVO> outVO = new ArrayList<AdminPageVO>();
		String statement = NAMESPACE + DOT + "loadBoardFromTitle";
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
	public int loadBoardCount() throws SQLException {
		int outVO = 0;
		String statement = NAMESPACE + DOT + "loadBoardCount";
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
	public int loadBoardCountOption(AdminPageVO vo) throws SQLException {
		int outVO = 0;
		String statement = NAMESPACE + DOT + "loadBoardCountOption";
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
	public int deleteBoard(AdminPageVO vo) throws SQLException {
		int flag = 0;

		String statement = NAMESPACE + DOT + "deleteBoard";
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
	public int notdeleteBoard(AdminPageVO vo) throws SQLException {
		int flag = 0;

		String statement = NAMESPACE + DOT + "notdeleteBoard";
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
