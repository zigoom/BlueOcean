package com.pcwk.ehr.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.PcwkLogger;

@Repository("AdminLogDao")
public class AdminLogDaoImpl implements PcwkLogger, AdminLogDao {
	private static final String NAMESPACE = "com.pcwk.ehr.adminlogpage";
	final String DOT = ".";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate; // DB 연결객체

	public AdminLogDaoImpl() {
	}

	@Override
	public int addLog(AdminPageVO vo) throws SQLException {
		int outVO = 0;
		String statement = NAMESPACE + DOT + "addLog";
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 1. statement-            │" + statement);
		LOG.debug("└──────────────────────────┘");
		outVO = this.sqlSessionTemplate.insert(statement, vo);
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 3. Check outVO           │" + outVO);
		LOG.debug("└──────────────────────────┘");

		return outVO;
	}

	@Override
	public List<AdminPageVO> loadLog() throws SQLException {
		List<AdminPageVO> outVO = new ArrayList<AdminPageVO>();
		String statement = NAMESPACE + DOT + "loadLog";
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
	public List<AdminPageVO> loadLogOption(AdminPageVO vo) throws SQLException {
		List<AdminPageVO> outVO = new ArrayList<AdminPageVO>();
		String statement = NAMESPACE + DOT + "loadLogOption";
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
	public int loadLogCount() throws SQLException {
		int outVO = 0;
		String statement = NAMESPACE + DOT + "loadLogCount";
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
	public int loadLogCountOption(AdminPageVO vo) throws SQLException {
		int outVO = 0;
		String statement = NAMESPACE + DOT + "loadLogCountOption";
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 1. statement-            │" + statement);
		LOG.debug("└──────────────────────────┘");
		outVO = this.sqlSessionTemplate.selectOne(statement, vo);
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 3. Check outVO           │" + outVO);
		LOG.debug("└──────────────────────────┘");

		return outVO;
	}

	@Override
	public List<AdminPageVO> loadLogFromId(AdminPageVO vo) throws SQLException {
		List<AdminPageVO> outVO = new ArrayList<AdminPageVO>();
		String statement = NAMESPACE + DOT + "loadLogFromId";
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
	public List<AdminPageVO> loadLogOptionFromId(AdminPageVO vo) throws SQLException {
		List<AdminPageVO> outVO = new ArrayList<AdminPageVO>();
		String statement = NAMESPACE + DOT + "loadLogOptionFromId";
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

}
