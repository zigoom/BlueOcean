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
		int add_flag = 0;
		int otp_flag = 0;
		int agree_flag = 0;
		
		
		 
		String member = this.NAMESPACE+DOT+"add";
		LOG.debug("┌─────────────────┐");
		LOG.debug("│DaoImpl구역       │"+member);
		LOG.debug("└─────────────────┘");
		LOG.debug("SignUpVO 값 ==" + userVO.toString());

		add_flag = this.sqlSessionTemplate.insert(member, userVO);
		
		
		String otp = this.NAMESPACE+DOT+"otp";
		LOG.debug("┌─────────────────┐");
		LOG.debug("│DaoImpl구역       │"+otp);
		LOG.debug("└─────────────────┘");
		LOG.debug("otp 값 ==" + userVO.toString());
		
		otp_flag = this.sqlSessionTemplate.insert(otp, userVO);

		String agree = this.NAMESPACE+DOT+"agree";
		LOG.debug("┌─────────────────┐");
		LOG.debug("│DaoImpl구역       │"+agree);
		LOG.debug("└─────────────────┘");
		LOG.debug("agree 값 ==" + userVO.toString());

		agree_flag = this.sqlSessionTemplate.insert(agree, userVO);

		LOG.debug("DaoImple flag 값 = " + add_flag);
		LOG.debug("DaoImple flag 값 = " + otp_flag);
		LOG.debug("DaoImple flag 값 = " + agree_flag);
		
		if (add_flag == 1 && otp_flag == 1 && agree_flag == 1) {
			flag = 1;
		}
		else {
			flag = 0;
		}
		
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
