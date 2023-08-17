package com.pcwk.ehr.dao;

import java.sql.SQLException;
import java.util.Random;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.domain.UserVO;

@Repository
public class FindDaoImpl implements FindDao, PcwkLogger {
	final String NAMESPACE = "com.pcwk.ehr.find";
	final String DOT = ".";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;// DB 연결객체
	
	
	public FindDaoImpl() {
	}

 
	@Override
	public String findId(UserVO user) throws SQLException, ClassNotFoundException {
		String userid = "";

		String statement = NAMESPACE + DOT + "findid";
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 1. statement-            │" + statement);
		LOG.debug("└──────────────────────────┘");
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 2. param=\n              │" + user.toString());
		LOG.debug("└──────────────────────────┘");
		userid = this.sqlSessionTemplate.selectOne(statement, user);
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 3. idCheck flag  1/0     │" + userid);
		LOG.debug("└──────────────────────────┘");

		return userid;
	}

	@Override
	public int userCheck(UserVO user)throws SQLException, ClassNotFoundException {
		int flag = 0;
		
		String statement = NAMESPACE + DOT + "usercheck";
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
	public int updateOTP(UserVO user) throws SQLException, ClassNotFoundException {
		String statement = NAMESPACE + DOT + "updateOTP";
	    LOG.debug("┌──────────────────────────┐");
	    LOG.debug("│ 1. statement-            │" + statement);
	    LOG.debug("└──────────────────────────┘");
	    LOG.debug("┌──────────────────────────┐");
	    LOG.debug("│ 2. param=\n              │" + user.toString());
	    LOG.debug("└──────────────────────────┘");
	    
	    int flag = this.sqlSessionTemplate.update(statement, user);
	    
	    LOG.debug("┌──────────────────────────┐");
	    LOG.debug("│ 3. updateUserOTP flag    │" + flag);
	    LOG.debug("└──────────────────────────┘");
	    
	    return flag;
	}
	


	
	
	
	
}
