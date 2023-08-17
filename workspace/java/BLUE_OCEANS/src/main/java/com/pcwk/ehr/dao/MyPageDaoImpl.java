package com.pcwk.ehr.dao;

import java.util.HashMap;
import java.util.Map;

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
	@Override	
	public MyPageVO getMemberById(String userId) {
		System.out.println("│ MyPageDaoImpl-getMemberById│");
		
        return sqlSessionTemplate.selectOne(NAMESPACE + DOT + "getMemberById", userId);
    }
	@Override	
	public int userUpdate(MyPageVO user) {		
		System.out.println("│ MyPageDaoImpl-userUpdate│");
		System.out.println("user"+user.toString());

        
		 int flag = 0;
		 flag = sqlSessionTemplate.update(NAMESPACE + DOT + "userUpdate", user);

	     
	     System.out.println("flag : "+flag);
		 return flag;
	
	}
	
 	@Override
    public int withdraw(MyPageVO user) {
 		System.out.println("│ MyPageDaoImpl-withdraw│");
 		
 		int flag = 0;
 		flag = sqlSessionTemplate.update(NAMESPACE + DOT + "withdraw", user);
 		
 		System.out.println("flag : "+flag);
 		return flag;
 		
    }
	

}
