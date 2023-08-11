package com.pcwk.ehr.service;

import com.pcwk.ehr.cmn.MyPageVO;

public interface MyPageService {
	
	MyPageVO getMemberById(String userId);
    void updateUser(MyPageVO user);

}
