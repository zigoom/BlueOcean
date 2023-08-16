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

    @Override
    public int doSave(BoardVO inVO) throws SQLException {
        // BoardDao의 doSave 메서드를 호출하여 데이터를 저장합니다.
        // 구현이 완료되면 저장된 데이터의 개수를 반환합니다.
    	System.out.println("doSave 서비스");
        return boardDao.doSave(inVO);
    }

    @Override
    public int doDelete(BoardVO inVO) throws SQLException {
        // BoardDao의 doDelete 메서드를 호출하여 데이터를 삭제합니다.
        // 구현이 완료되면 삭제된 데이터의 개수를 반환합니다.
        return boardDao.doDelete(inVO);
    }

    @Override
    public int doUpdate(BoardVO inVO) throws SQLException {
        // BoardDao의 doUpdate 메서드를 호출하여 데이터를 수정합니다.
        // 구현이 완료되면 수정된 데이터의 개수를 반환합니다.
        return boardDao.doUpdate(inVO);
    }

    @Override
    public BoardVO doSelectOne(BoardVO inVO) throws SQLException {
		//1. 단건조회
		//2. 조회 count증가
		BoardVO vo = boardDao.doSelectOne(inVO);
		
		if(null !=vo ) {
			boardDao.doUpdateReadCnt(inVO);
		}
		System.out.println("Service doSelectOne 구역");
		return vo;
    }

    @Override
    public List<BoardVO> doRetrieve(BoardVO inVO) throws SQLException {
        // BoardDao의 doRetrieve 메서드를 호출하여 데이터 리스트를 조회합니다.
        // 조회된 데이터 리스트를 반환합니다.
    	
    	System.out.println("Service doRetrieve 구역");
    	
        return boardDao.doRetrieve(inVO);
    }

    
    
    

}
