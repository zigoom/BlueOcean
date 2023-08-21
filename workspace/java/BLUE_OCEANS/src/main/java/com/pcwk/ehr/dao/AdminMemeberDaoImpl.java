package com.pcwk.ehr.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.PcwkLogger;

@Repository("AdminMemberDao")
public class AdminMemeberDaoImpl implements AdminMemberDao, PcwkLogger {
	private static final String NAMESPACE = "com.pcwk.ehr.adminmemberpage";
	final String DOT = ".";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate; // DB 연결객체

	public AdminMemeberDaoImpl() {
	}

	@Override
	public List<AdminPageVO> loadMember() throws SQLException {
		List<AdminPageVO> outVO = new ArrayList<AdminPageVO>();
		String statement = NAMESPACE + DOT + "loadMember";
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
	public List<AdminPageVO> loadMemberOption(AdminPageVO vo) throws SQLException {
		List<AdminPageVO> outVO = new ArrayList<AdminPageVO>();
		String statement = NAMESPACE + DOT + "loadMemberOption";
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
	public List<AdminPageVO> loadMemberFromId(AdminPageVO vo) throws SQLException {
		List<AdminPageVO> outVO = new ArrayList<AdminPageVO>();
		String statement = NAMESPACE + DOT + "loadMemberFromId";
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
	public int loadMemberCount() throws SQLException {
		int outVO = 0;
		String statement = NAMESPACE + DOT + "loadMemberCount";
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
	public int loadMemberCountOption(AdminPageVO vo) throws SQLException {
		int outVO = 0;
		String statement = NAMESPACE + DOT + "loadMemberCountOption";
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
	public int deleteMember(AdminPageVO vo) throws SQLException {
		int flag = 0;

		String statement = NAMESPACE + DOT + "deleteMember";
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
	public int notdeleteMember(AdminPageVO vo) throws SQLException {
		int flag = 0;

		String statement = NAMESPACE + DOT + "notdeleteMember";
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
