package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.WorkDiv;

public interface AdminTermsofuseDetailService {
	
	
	/**
	 * 이용약관 상세를 불러오는 메소드
	 * @return
	 * @throws SQLException
	 */
	public AdminPageVO loadTermsofuseDetail(AdminPageVO inVO) throws SQLException;
	
	
	
}