package com.pcwk.ehr.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.domain.BoardVO;
import com.pcwk.ehr.domain.ReplyVO;


/**
 * 1.doSave
 * 2.doRetrieve
 * 3.doDelete
 * 4.doUpdate
 * 
 * @author user
 *
 */

@Repository
public class ReplyDaoImpl implements ReplyDao, PcwkLogger {
    final String NAMESPACE = "com.pcwk.ehr.dao.ReplyDao";
    final String DOT = ".";

    
    
    @Autowired
    SqlSessionTemplate sqlSessionTemplate;  //DB 객체 생성

    
    
    
    
    // 댓글 저장
	@Override
	public int doSave(ReplyVO inVO) throws SQLException {
		
		System.out.println("=                     =");
    	System.out.println("replyDoSave DAOIMPL 구역");
    	System.out.println("DAOIMPL에서 inVO 값은 : "+inVO);
    	
		return sqlSessionTemplate.insert(NAMESPACE+DOT+"doSave", inVO);
	}
	
	
	
	
	
	// 댓글 화면 조회 출력
	@Override
	public List<ReplyVO> doRetrieve(ReplyVO inVO) throws SQLException {
		
	   	System.out.println("Reply doRetrieve DAOIMPL 구역");

        return sqlSessionTemplate.selectList(NAMESPACE + DOT + "doRetrieve", inVO);
	}

	
	
	
	
	// 댓글 삭제
	@Override
	public int doDelete(ReplyVO inVO) throws SQLException {
		
		System.out.println("Reply doDelete DAOIMPL 구역");
		
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doDelete                      │");
		LOG.debug("│inVO의 값은                                     │"+inVO);
		LOG.debug("│statement                     │"+NAMESPACE+DOT+"doDelete");
		LOG.debug("└──────────────────────────────┘");	
		
		return sqlSessionTemplate.update(NAMESPACE+DOT+"doDelete", inVO);
		
	}

	
	
	
	// 댓글 수정
	@Override
	public int doUpdate(ReplyVO inVO) throws SQLException {
		
		System.out.println("Reply doUpdate DAOIMPL 구역");
    	
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│Reply doUpdate                      │");
		LOG.debug("│inVO                          │"+inVO);
		LOG.debug("│statement                     │"+NAMESPACE+DOT+"doUpdate");
		LOG.debug("└──────────────────────────────┘");
		
		return sqlSessionTemplate.update(NAMESPACE+DOT+"doUpdate", inVO);
	}





	
	
    
	
	
	
	
	
	
	
	
	
	
    
	@Override
	public ReplyVO doSelectOne(ReplyVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}


    

}
