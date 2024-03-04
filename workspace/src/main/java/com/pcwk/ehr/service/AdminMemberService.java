package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.dao.AdminMemberDao;

public interface AdminMemberService {
	/**
	 * 멤버목록 불러오기
	 * 
	 * @return
	 * @throws SQLException
	 */
	List<AdminPageVO> loadMember() throws SQLException;

	/**
	 * 멤버목록 불러오기(탈퇴여부에 따른 조회)
	 * 
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	List<AdminPageVO> loadMemberOption(AdminPageVO vo) throws SQLException;
	
	/**
	 * 멤버목록 불러오기(유저아이디를 통해서)
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	List<AdminPageVO> loadMemberFromId(AdminPageVO vo) throws SQLException;

	/**
	 * 멤버 카운트
	 * 
	 * @return
	 * @throws SQLException
	 */
	int loadMemberCount() throws SQLException;

	/**
	 * 멤버 카운트(탈퇴여부에 따른 조회)
	 * 
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	int loadMemberCountOption(AdminPageVO vo) throws SQLException;

	/**
	 * 멤버 삭제
	 * 
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	int deleteMember(AdminPageVO vo) throws SQLException;

	/**
	 * 멤버 복구
	 * 
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	int notdeleteMember(AdminPageVO vo) throws SQLException;

}
