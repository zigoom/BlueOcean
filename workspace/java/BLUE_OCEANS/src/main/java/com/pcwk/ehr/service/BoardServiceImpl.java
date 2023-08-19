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

    
    
 
    //게시물 클릭 
//    @Override
//    public boardDetail(BoardVO inVO) throws SQLException {
//    	
//    	System.out.println("boardDetail 서비스 구역");
//    	System.out.println("inVO 값은 : "+inVO);
//    	
//    	return boardDao.boardDetail(inVO);
//    }
    
    
    // 게시물 글 저장
    @Override
    public int doSave(BoardVO inVO) throws SQLException {
        // BoardDao의 doSave 메서드를 호출하여 데이터를 저장합니다.
        // 구현이 완료되면 저장된 데이터의 개수를 반환합니다.
    	
    	System.out.println("doSave 서비스");
    	
        return boardDao.doSave(inVO);
    }
    
    
    // 게시물 상세페이지 삭제
    @Override
    public int doDelete(BoardVO inVO) throws SQLException {
        // BoardDao의 doDelete 메서드를 호출하여 데이터를 삭제합니다.
        // 구현이 완료되면 삭제된 데이터의 개수를 반환합니다.
        return boardDao.doDelete(inVO);
    }

    
    // 게시물 상세페이지 수정
    @Override
    public int doUpdate(BoardVO inVO) throws SQLException {
        // BoardDao의 doUpdate 메서드를 호출하여 데이터를 수정합니다.
        // 구현이 완료되면 수정된 데이터의 개수를 반환합니다.
        return boardDao.doUpdate(inVO);
    }

    
    
    // 게시판에서 제목 클릭 시 상세페이지로 이동 
    @Override
    public BoardVO doSelectOne(BoardVO inVO) throws SQLException {
		//1. 단건조회
		//2. 조회 count증가
    	
		BoardVO vo = boardDao.doSelectOne(inVO);
		System.out.println("Service doSelectOne 구역");
		
//		if(null !=vo ) {
//			boardDao.doUpdateReadCnt(inVO);
//		}
//		
		
		return vo;
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
