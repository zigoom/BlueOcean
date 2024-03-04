package com.pcwk.ehr.dao;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.domain.UserVO;

@Repository
public class LoginDaoImpl implements LoginDao, PcwkLogger {
	final String NAMESPACE = "com.pcwk.ehr.login";
	final String DOT = ".";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;// DB 연결객체
	
	
	public LoginDaoImpl() {
	}
 
	@Override
	public int idCheck(UserVO user) throws SQLException {

		int flag = 0;

		String statement = NAMESPACE + DOT + "idCheck";
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 1. statement-            │" + statement);
		LOG.debug("└──────────────────────────┘");
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 2. param=\n              │" + user.toString());
		LOG.debug("└──────────────────────────┘");
		flag = this.sqlSessionTemplate.selectOne(statement, user);
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 3. idCheck flag  1/0     │" + flag);
		LOG.debug("└──────────────────────────┘");

		return flag;
	}


	@Override
	@SuppressWarnings("deprecation")
	public UserVO get(UserVO user)throws SQLException{
		UserVO outVO = null;
		
        String statement = this.NAMESPACE+DOT+"get";
		LOG.debug("----------------------------");
		LOG.debug("1. statement-"+statement);
		LOG.debug("----------------------------");
		LOG.debug("2. param=\n"+user.toString());
		
		outVO = this.sqlSessionTemplate.selectOne(statement,user);
		LOG.debug("3.outVO:"+outVO);
		
	
		return outVO;
	}
	
	
	
	
	
	
}
