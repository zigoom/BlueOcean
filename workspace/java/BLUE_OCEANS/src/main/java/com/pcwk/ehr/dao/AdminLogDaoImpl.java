package com.pcwk.ehr.dao;

import java.sql.SQLException;

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

}
