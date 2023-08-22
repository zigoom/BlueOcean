package com.pcwk.ehr.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.PcwkLogger;

@Repository("AdminTermsofuseDao")
public class AdminTermsofuseDaoImpl implements AdminTermsofuseDao, PcwkLogger{
	
	private static final String NAMESPACE="com.pcwk.ehr.adminTermsofuse";
	final String DOT = ".";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;		// DB 객체생성
	
	public AdminTermsofuseDaoImpl() {}
	
	@Override
	public int doSave(AdminPageVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int doDelete(AdminPageVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int doUpdate(AdminPageVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public AdminPageVO doSelectOne(AdminPageVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<AdminPageVO> doRetrieve(AdminPageVO inVO) throws SQLException {
		List<AdminPageVO> flag;
		
		String statement = NAMESPACE + DOT + "doRetrieve";
		
		// 로그 출력
        LOG.debug("┌──────────────────────────┐");
        LOG.debug("│ 1. statement-            │" + statement);
        LOG.debug("└──────────────────────────┘");
        LOG.debug("┌──────────────────────────┐");
        LOG.debug("│ 2. param=\n              │" + inVO.toString());
        LOG.debug("└──────────────────────────┘");
        
        flag = this.sqlSessionTemplate.selectOne(statement,inVO);
        
        LOG.debug("┌──────────────────────────┐");
        LOG.debug("│ 3. Check flag            │" + flag);
        LOG.debug("└──────────────────────────┘");
        
		return flag;
	}
}
