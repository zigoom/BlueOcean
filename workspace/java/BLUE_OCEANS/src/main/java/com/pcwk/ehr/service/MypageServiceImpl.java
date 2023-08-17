package com.pcwk.ehr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pcwk.ehr.cmn.MyPageVO;
import com.pcwk.ehr.dao.MyPageDao;
import com.pcwk.ehr.service.MyPageService;
import com.pcwk.ehr.cmn.PcwkLogger;
@Service
public class MypageServiceImpl implements MyPageService {
	
	
	 @Autowired
	    private MyPageDao myPageDAO;
	 

	    @Override
	    public MyPageVO getMemberById(String userId) {
			System.out.println("│ MypageServiceImpl-getMemberById│");	    	
	    	MyPageVO user = myPageDAO.getMemberById(userId);
	        return user;
	    }

	    @Override
	    public int userUpdate(MyPageVO user) {
	    	System.out.println("│ MypageServiceImpl-userUpdate│");

	        
	        int flag = 0;
	        flag =  myPageDAO.userUpdate(user);
	        return flag;
	    }
	    
	    @Override
	    public int withdraw(MyPageVO user) {
	    	System.out.println("│ MypageServiceImpl-withdraw│");
	    	
	    	int flag = 0;
	    	flag = myPageDAO.withdraw(user);
	    	return flag;
	        
	    }
	    

	
}
