package com.pcwk.ehr.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.WorkDiv;

public interface AdminTermsofuseDao{
	
	/**
	 * 이용약관 목록 불러오는 메소드
	 * @return
	 * @throws SQLException
	 */
	List<AdminPageVO> loadtermsofuse() throws SQLException;
	
	
	
}
