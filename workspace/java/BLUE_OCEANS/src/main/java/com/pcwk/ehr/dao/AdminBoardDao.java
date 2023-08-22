package com.pcwk.ehr.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.AdminPageVO;

public interface AdminBoardDao {

	/**
	 * 보드목록 불러오기
	 * 
	 * @return
	 * @throws SQLException
	 */
	List<AdminPageVO> loadBoard() throws SQLException;

	/**
	 * 보드목록 불러오기(삭제여부에 따른 조회)
	 * 
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	List<AdminPageVO> loadBoardOption(AdminPageVO vo) throws SQLException;

	/**
	 * 보드목록 불러오기(타이틀을 통해서)
	 * 
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	List<AdminPageVO> loadBoardFromTitle(AdminPageVO vo) throws SQLException;

	/**
	 * 보드목록 카운트
	 * 
	 * @return
	 * @throws SQLException
	 */
	int loadBoardCount() throws SQLException;

	/**
	 * 보드목록 카운트(삭제여부에 따른 조회)
	 * 
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	int loadBoardCountOption(AdminPageVO vo) throws SQLException;

	/**
	 * 보드 삭제
	 * 
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	int deleteBoard(AdminPageVO vo) throws SQLException;

	/**
	 * 보드 복구
	 * 
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	int notdeleteBoard(AdminPageVO vo) throws SQLException;
}
