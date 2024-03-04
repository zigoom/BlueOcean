package com.pcwk.ehr.dao;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.domain.UserVO;

@Repository
public class OtpDaoImpl implements OtpDao, PcwkLogger {
	
	private static final String NAMESPACE = "com.pcwk.ehr.otp";
	private static final String DOT       = ".";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate; //DB연결 객체

	
	// **** default 생성
	public OtpDaoImpl () {}


	@Override
	public String setOtp(UserVO userVO) throws ClassNotFoundException, SQLException {
		
		
		String otp = this.NAMESPACE+DOT+"setotp";

		LOG.debug("┌─────────────────┐");
		LOG.debug("│DaoImpl구역                 │"+otp);
		LOG.debug("└─────────────────┘");
		LOG.debug("agree 값 ==" + otp.toString());
		
        int setotp = sqlSessionTemplate.update(otp,userVO);

		return String.valueOf(setotp);
	}


	@Override
	public String reSetOtp(UserVO userVO) throws Exception {
		String otp = this.NAMESPACE+DOT+"resetotp";

		LOG.debug("┌─────────────────┐");
		LOG.debug("│DaoImpl구역                 │"+otp);
		LOG.debug("└─────────────────┘");
		LOG.debug("agree 값 ==" + otp.toString());
		
		int resetotp = sqlSessionTemplate.update(otp,userVO);

		return String.valueOf(resetotp);
	}
	
	@Override
	public String selectOtp(UserVO userVO) throws Exception {
		String otp = this.NAMESPACE+DOT+"selectotp";

		LOG.debug("┌─────────────────┐");
		LOG.debug("│DaoImpl구역                 │"+otp);
		LOG.debug("└─────────────────┘");
		LOG.debug("agree 값 ==" + otp.toString());
		
		int selectOtp = sqlSessionTemplate.selectOne(otp,userVO);

		return String.valueOf(selectOtp);
	}
	
	

}
