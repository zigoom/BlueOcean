package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.WorkDiv;

public interface AdminTermsofuseService {
	
	/**
	 * 이용약관을 조회하는 메소드
	 * @param inVO
	 * @return 등록된 이용약관 개수
	 * @throws SQLException 데이터 베이스 관련 예외 발생 시
	 */
	public List<AdminPageVO> doRetrieveTermsofuse(AdminPageVO inVO) throws SQLException;
}
