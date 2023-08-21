package com.pcwk.ehr.service;
	
import com.pcwk.ehr.domain.BoardVO;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.WorkDiv;
	
public interface BoardService extends WorkDiv<BoardVO> {

	int doUpdateReadCnt(BoardVO inVO) throws SQLException;

	 


	
}
