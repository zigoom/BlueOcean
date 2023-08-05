package com.pcwk.ehr.dao;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.domain.UserVO;

@Repository
public class SignUpDaoImpl implements SignUpDao, PcwkLogger {
	
	private static final String NAMESPACE = "com.pcwk.ehr.signup";
	private static final String DOT       = ".";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate; //DB연결 객체

	
	// **** default 생성
	public SignUpDaoImpl () {}
	
	@Override
	public int add(UserVO userVO) throws SQLException, ClassNotFoundException {
		
		int flag = 0;
		
		
		
		String statement = this.NAMESPACE+DOT+"add";
		
		LOG.debug("┌─────────────────┐");
		LOG.debug("│DaoImpl구역                 │"+statement);
		LOG.debug("└─────────────────┘");
		LOG.debug("SignUpVO 값 ==" + userVO.toString());
		
		flag = this.sqlSessionTemplate.insert(statement, userVO); 
		
		LOG.debug("DaoImple flag 값 = " + flag);
		
		return flag;

	}
	
	
	
	// 아이디 중복 검사
	public int idCheck(String userId) throws Exception {
		
		String statementtwo = this.NAMESPACE+DOT+"idCheck";
		
		int cnt = sqlSessionTemplate.selectOne(statementtwo, userId);
		
		return cnt;
		
	}

}
