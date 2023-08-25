package com.pcwk.ehr.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.domain.UserVO;


public interface SignUpDao<TermsOfUseVO> {

	// 회원가입
	public int add(UserVO userVO) throws ClassNotFoundException, SQLException;
		
	 
	//중복검사
	public int idCheck(String userId) throws Exception;

	public int otp(UserVO userVO);

	public int agree(UserVO userVO);

	public int getTotalTermsOfUseCount();
	
	public List<UserVO> doRetrieveTermsofuse(UserVO inVO);



}
