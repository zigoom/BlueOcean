package com.pcwk.ehr.dao;

import com.pcwk.ehr.cmn.MyPageVO;

public interface MyPageDao {
	
    MyPageVO getMemberById(String userId);
    
    int userUpdate(MyPageVO user);
    
    int withdraw(MyPageVO user);
    

	
}
