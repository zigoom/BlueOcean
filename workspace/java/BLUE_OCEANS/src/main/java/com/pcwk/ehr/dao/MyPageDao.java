package com.pcwk.ehr.dao;

import com.pcwk.ehr.cmn.MyPageVO;

public interface MyPageDao {
	
    MyPageVO getMemberById(String userId);
    
    void updateUser(MyPageVO user);
	
}
