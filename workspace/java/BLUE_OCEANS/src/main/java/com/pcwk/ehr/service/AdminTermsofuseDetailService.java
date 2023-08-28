package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.WorkDiv;

public interface AdminTermsofuseDetailService {

	/**
	 * 이용약관 상세를 불러오는 메소드
	 * 
	 * @return
	 * @throws SQLExceptiona
	 */
	public AdminPageVO loadTermsofuseDetail(AdminPageVO inVO) throws SQLException;

	/**
	 * 이용약관 수정을 하는 메소드
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int termsofuseUpdate(AdminPageVO vo)throws SQLException;
	
	/**
	 * 이용약관 삭제를 하는 메소드
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int termsofuseDelete(AdminPageVO vo)throws SQLException;

}
