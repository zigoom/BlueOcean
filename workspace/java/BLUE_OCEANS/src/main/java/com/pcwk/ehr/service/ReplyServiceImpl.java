package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.dao.BoardDao;
import com.pcwk.ehr.dao.ReplyDao;

import com.pcwk.ehr.domain.BoardVO;
import com.pcwk.ehr.domain.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	
    @Autowired
    ReplyDao replyDao;

    
    
    // 댓글 등록
	@Override
	public int doSave(ReplyVO inVO) throws SQLException {

		System.out.println("ReplydoSave 서비스 구역");
		
		return replyDao.doSave(inVO);
	}

	
	// 댓글 출력 조회
	@Override
	public List<ReplyVO> doRetrieve(ReplyVO inVO) throws SQLException {
		
		
		System.out.println("Reply doRetrieve 서비스 구역");
		
		
		return replyDao.doRetrieve(inVO);
	}
	
	
	// 댓글 삭제
	@Override
	public int doDelete(ReplyVO inVO) throws SQLException {
		
    	System.out.println("Reply doDelete 서비스 구역 ");
    	System.out.println("inVO 값은 : "+inVO);
    	
		return replyDao.doDelete(inVO);
	}

	
	
	
	@Override
	public int doUpdate(ReplyVO inVO) throws SQLException {
		
		System.out.println("Reply doUpdate 서비스 구역 ");
    	System.out.println("inVO 값은 : "+inVO);
    	
        return replyDao.doUpdate(inVO);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public ReplyVO doSelectOne(ReplyVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	
	

}
