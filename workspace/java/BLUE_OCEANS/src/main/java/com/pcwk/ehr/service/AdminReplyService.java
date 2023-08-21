package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.dao.AdminReplyDao;


public interface AdminReplyService {

	/**
	 * 댓글전체목록 불러오기
	 * 
	 * @return
	 * @throws SQLException
	 */
	List<AdminPageVO> loadReply() throws SQLException;
	
	/**
	 * 댓글목록 불러오기(탈퇴여부에 따른 조회)
	 * 
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	List<AdminPageVO> loadReplyOption(AdminPageVO vo) throws SQLException;
	
	/**
	 * 댓글목록 불러오기(유저아이디를 통해서)
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	List<AdminPageVO> loadReplyFromId(AdminPageVO vo) throws SQLException;

	/**
	 * 댓글 카운트
	 * 
	 * @return
	 * @throws SQLException
	 */
	int loadReplyCount() throws SQLException;

	/**
	 * 댓글 카운트(삭제여부에 따른 조회)
	 * 
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	int loadReplyCountOption(AdminPageVO vo) throws SQLException;

	/**
	 * 댓글 삭제
	 * 
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	int deleteReply(AdminPageVO vo) throws SQLException;

	/**
	 * 댓글 복구
	 * 
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	int notdeleteReply(AdminPageVO vo) throws SQLException;
}
