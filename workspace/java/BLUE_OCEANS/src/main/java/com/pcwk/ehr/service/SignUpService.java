package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;
import com.pcwk.ehr.domain.UserVO;


@Service
public interface SignUpService {
	 
	/**
	 * 신규회원가입
	 * 
	 * @param userVO
	 * @return
	 * @throws SQLException
	 */
	public int add(UserVO userVO) throws ClassNotFoundException, SQLException;

	// 아이디 중복 검사
	/**
	 * 
	 * @param userID
	 * @return
	 * @throws Exception
	 */
	public int idCheck(String userID) throws Exception;
	
	public int agree(UserVO userVO);

	public List<UserVO> doRetrieveTermsofuse(UserVO inVO) throws SQLException;

	
}
