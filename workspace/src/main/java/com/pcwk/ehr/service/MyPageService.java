package com.pcwk.ehr.service;

import com.pcwk.ehr.cmn.MyPageVO;

public interface MyPageService {
	
	MyPageVO getMemberById(String userId);
    int userUpdate(MyPageVO user);
    int withdraw(MyPageVO user);


}
