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


/**
 * 1.doSave
 * 2.doDelete
 * 3.doUpdate
 * 4.doSelectOne
 * 5.doRetrieveCount
 * 6.doRetrieve
 * 7.doUpdateReadCnt
 * 
 * @author user
 *
 */

@Repository
public class BoardDaoImpl implements BoardDao, PcwkLogger {
    final String NAMESPACE = "com.pcwk.ehr.dao.BoardDao";
    final String DOT = ".";

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;  //DB 객체 생성

    
    
    
    
    
    @Override
    public int doSave(BoardVO inVO) throws SQLException {
    	
    	System.out.println("doSave DAOIMPL구역");
    	System.out.println("DAOIMPL에서 inVO 값은 : "+inVO);
    	
		return sqlSessionTemplate.insert(NAMESPACE+DOT+"doSave", inVO);
    }

    
    
    
    
    
    @Override
    public int doDelete(BoardVO inVO) throws SQLException {
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doDelete                      │");
		LOG.debug("│inVO의 값은                                     │"+inVO);
		LOG.debug("│statement                     │"+NAMESPACE+DOT+"doDelete");
		LOG.debug("└──────────────────────────────┘");	
		
		return sqlSessionTemplate.update(NAMESPACE+DOT+"doDelete", inVO);
    }

    
    
    
    
    @Override
    public int doUpdate(BoardVO inVO) throws SQLException {
    	System.out.println("doUpdate 다오임플 구역");
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doUpdate                      │");
		LOG.debug("│inVO                          │"+inVO);
		LOG.debug("│statement                     │"+NAMESPACE+DOT+"doUpdate");
		LOG.debug("└──────────────────────────────┘");	
		return sqlSessionTemplate.update(NAMESPACE+DOT+"doUpdate", inVO);
    }

    
    
    
    
    @Override
    public BoardVO doSelectOne(BoardVO inVO) throws SQLException {
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doSelectOne                   │");
		LOG.debug("│inVO                          │"+inVO);
		LOG.debug("│statement                     │"+NAMESPACE+DOT+"doSelectOne");
		LOG.debug("└──────────────────────────────┘");	
		
		System.out.println("다오임플 doSelectOne 구역");
		
		return sqlSessionTemplate.selectOne(NAMESPACE+DOT+"doSelectOne", inVO);
		
    }

    
    
    
    
    
    @Override
    public int doRetrieveCount(BoardVO inVO) throws SQLException {
        //return sqlSessionTemplate.selectOne(NAMESPACE + DOT + "doRetrieveCount", inVO);
    	return 0;
    }

    
    
    
    
    
    @Override
    public List<BoardVO> doRetrieve(BoardVO inVO) throws SQLException {
    	System.out.println("doRetrieve DAOIMPL구역");

        return sqlSessionTemplate.selectList(NAMESPACE + DOT + "doRetrieve", inVO);
    }

    
	@Override
	public int doUpdateReadCnt(BoardVO inVO) throws SQLException {
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doUpdateReadCnt               │");
		LOG.debug("│inVO                          │"+inVO);
		LOG.debug("│statement                     │"+NAMESPACE+DOT+"doUpdateReadCnt");
		LOG.debug("└──────────────────────────────┘");			
		
		return sqlSessionTemplate.update(NAMESPACE+DOT+"doUpdateReadCnt", inVO);
	}









    

}
