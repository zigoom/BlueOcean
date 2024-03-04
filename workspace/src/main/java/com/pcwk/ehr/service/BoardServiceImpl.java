package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.dao.BoardDao;
import com.pcwk.ehr.domain.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    BoardDao boardDao;

    
    
 

    
    
    // 게시물 글 저장
    @Override
    public int doSave(BoardVO inVO) throws SQLException {
        // BoardDao의 doSave 메서드를 호출하여 데이터를 저장합니다.
        // 구현이 완료되면 저장된 데이터의 개수를 반환합니다.
    	
    	System.out.println("doSave 서비스");
    	
        return boardDao.doSave(inVO);
    }
    
    


    
    // 게시물 상세페이지 수정
    @Override
    public int doUpdate(BoardVO inVO) throws SQLException {
        // BoardDao의 doUpdate 메서드를 호출하여 데이터를 수정합니다.
        // 구현이 완료되면 수정된 데이터의 개수를 반환합니다.
    	
    	System.out.println("doUpdate 서비스 구역 ");
    	System.out.println("inVO 값은 : "+inVO);
    	
        return boardDao.doUpdate(inVO);
    }

    
    
    // 게시물 상세페이지 삭제
    @Override
    public int doDelete(BoardVO inVO) throws SQLException {
        // BoardDao의 doDelete 메서드를 호출하여 데이터를 삭제합니다.
        // 구현이 완료되면 삭제된 데이터의 개수를 반환합니다.
    	
    	System.out.println("doDelete 서비스 구역 ");
    	System.out.println("inVO 값은 : "+inVO);
    	
        return boardDao.doDelete(inVO);
    }
    
    
    
    // 게시판에서 제목 클릭 시 상세페이지로 이동 
    @Override
    public BoardVO doSelectOne(BoardVO inVO) throws SQLException {
    	
		BoardVO outVO = boardDao.doSelectOne(inVO);

		System.out.println("Service doSelectOne 구역");
		System.out.println("서비스 outVO 값은 : "+ outVO);
		System.out.println("inVO 값은 : "+ inVO);
		
		return outVO;
    }

    
    
    
    // 유저의 이름과 작성자의 이름이 다를경우 조회수 올려주기 
    public int doUpdateReadCnt(BoardVO inVO ) throws SQLException {
    	int flag;
    	
    	flag = boardDao.doUpdateReadCnt(inVO);
    	
    	return flag;
    }
    

    
    // 게시물 조회
    @Override
    public List<BoardVO> doRetrieve(BoardVO inVO) throws SQLException {
        // BoardDao의 doRetrieve 메서드를 호출하여 데이터 리스트를 조회합니다.
        // 조회된 데이터 리스트를 반환합니다.
    	
    	System.out.println("doRetrieve Service  구역");
    	
        return boardDao.doRetrieve(inVO);
    }

    
    
    

}
