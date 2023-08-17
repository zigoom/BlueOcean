package com.pcwk.ehr.service;

import java.sql.SQLException;
import org.springframework.stereotype.Service;
import com.pcwk.ehr.domain.UserVO;


@Service
public interface SignUpService {
	 
	/**
	 * 신규회원가입
	 * 
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	public int add(UserVO userVO) throws ClassNotFoundException, SQLException;

	// 아이디 중복 검사
	public int idCheck(String userID) throws Exception;
}
