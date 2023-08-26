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
	public String reSetOtp(UserVO userVO) throws Exception {
		String otp = this.NAMESPACE+DOT+"resetotp";

		LOG.debug("┌─────────────────┐");
		LOG.debug("│DaoImpl구역                 │"+otp);
		LOG.debug("└─────────────────┘");
		LOG.debug("reSetOtp 값 ==" + otp.toString());
		
		int resetotp = sqlSessionTemplate.update(otp,userVO);

		return String.valueOf(resetotp);
	}
	
	@Override
	public String selectOtp(UserVO userVO) throws Exception {
		String otp = this.NAMESPACE+DOT+"selectotp";

		LOG.debug("┌─────────────────┐");
		LOG.debug("│DaoImpl구역                 │"+otp);
		LOG.debug("└─────────────────┘");
		LOG.debug("selectOtp 값 ==" + otp.toString());
		
		int selectOtp = sqlSessionTemplate.selectOne(otp,userVO);

		return String.valueOf(selectOtp);
	}
	
	@Override
	public int setOtp(UserVO userVO) throws ClassNotFoundException, SQLException {
		
		
		String otp = this.NAMESPACE+DOT+"setotp";

		LOG.debug("┌─────────────────┐");
		LOG.debug("│DaoImpl구역                 │"+otp);
		LOG.debug("└─────────────────┘");
		LOG.debug("setOtp 값 ==" + otp.toString());
		
        int setotp = sqlSessionTemplate.update(otp,userVO);

		return setotp;
	}
	
	@Override
	public int usingOTP(UserVO user) throws SQLException, ClassNotFoundException {
		int OTP = 0;

		
		String statement = NAMESPACE + DOT + "usingOtp";
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 1. statement-            │" + statement);
		LOG.debug("└──────────────────────────┘");
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 2. param=\n              │" + user.toString());
		LOG.debug("└──────────────────────────┘");
		OTP = this.sqlSessionTemplate.selectOne(statement, user);
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 3. usingOTP      1/0     │" + OTP);
		LOG.debug("└──────────────────────────┘");

		return OTP;
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
		LOG.debug("│ 3. findId        1/0     │" + userid);
		LOG.debug("└──────────────────────────┘");

		return userid;
	}
	
	@Override
	public int otpuserCheck(UserVO user)throws SQLException, ClassNotFoundException {
		int flag = 0;
		
		String statement = NAMESPACE + DOT + "otpusercheck";
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
	public int checkOTP(UserVO user) throws SQLException, ClassNotFoundException {
		int otp = 0;
		
		String statement = NAMESPACE + DOT + "checkotp";
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 1. statement-            │" + statement);
		LOG.debug("└──────────────────────────┘");
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 2. param=\n              │" + user.toString());
		LOG.debug("└──────────────────────────┘");
		otp = this.sqlSessionTemplate.selectOne(statement, user);
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 3. checkOTP      1/0     │" + otp);
		LOG.debug("└──────────────────────────┘");
		

		
		return otp;
	}

	@Override
	public int resetPassWd(UserVO user) throws Exception {
		int check = 0;
		
		String statement = NAMESPACE + DOT + "resetpasswd";
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 1. statement-            │" + statement);
		LOG.debug("└──────────────────────────┘");
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 2. param=\n              │" + user.toString());
		LOG.debug("└──────────────────────────┘");
		check = this.sqlSessionTemplate.update(statement, user);
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 3. resetPassWd   1/0     │" + check);
		LOG.debug("└──────────────────────────┘");
		

		
		return check;
	}

	@Override
	public UserVO seletePasswd(UserVO user) throws Exception {
		UserVO outVO = null;
		
		String statement = NAMESPACE + DOT + "seletepasswd";
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 1. statement-            │" + statement);
		LOG.debug("└──────────────────────────┘");
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 2. param=\n              │" + user.toString());
		LOG.debug("└──────────────────────────┘");
		outVO = this.sqlSessionTemplate.selectOne(statement, user);
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 3. seletePasswd   1/0    │" + outVO);
		LOG.debug("└──────────────────────────┘");
			
		return outVO;
	}	



	


	
	
	
	
}
