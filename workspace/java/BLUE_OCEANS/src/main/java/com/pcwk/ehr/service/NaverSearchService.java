package com.pcwk.ehr.service;
import java.io.IOException;

import com.pcwk.ehr.cmn.DTO;

public interface NaverSearchService {

	/**
	 * naver: news
	 * @param inVO
	 * @return 검색결과(JSON)
	 * @throws IOException
	 */
	public String doNaverSearch(String keyword)throws IOException;
}
	