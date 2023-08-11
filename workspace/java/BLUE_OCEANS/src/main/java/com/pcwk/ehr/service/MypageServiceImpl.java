package com.pcwk.ehr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.cmn.MyPageVO;
import com.pcwk.ehr.dao.MyPageDao;
import com.pcwk.ehr.service.MyPageService;

@Service
public class MypageServiceImpl implements MyPageService {
	
	
	 @Autowired
	    private MyPageDao myPageDAO;

	    @Override
	    public MyPageVO getMemberById(String userId) {
	        return myPageDAO.getMemberById(userId);
	    }

	    @Override
	    public void updateUser(MyPageVO user) {
	        myPageDAO.updateUser(user);
	    }
	
	
}
