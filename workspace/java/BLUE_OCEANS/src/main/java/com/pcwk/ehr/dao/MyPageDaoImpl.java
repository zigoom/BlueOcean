package com.pcwk.ehr.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.cmn.MyPageVO;
import com.pcwk.ehr.cmn.PcwkLogger;

import com.pcwk.ehr.domain.UserVO;

@Repository
public class MyPageDaoImpl implements MyPageDao {
	
	final String NAMESPACE = "com.pcwk.ehr.mypage";
	final String DOT = ".";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;// DB 연결객체
	
	public MyPageDaoImpl() {
		
	}
		
	public MyPageVO getMemberById(String userId) {
        return sqlSessionTemplate.selectOne(NAMESPACE + DOT + "getMemberById", userId);
    }
		
	public void updateUser(MyPageVO user) {		
		 sqlSessionTemplate.update(NAMESPACE + DOT + "updateUser", user);
	
	}
	
	public int deleteUser(UserVO user) {
		int flag = 0;
		
		return flag;
	}
	
	
	

}
