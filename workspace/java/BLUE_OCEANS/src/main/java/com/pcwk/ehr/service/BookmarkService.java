package com.pcwk.ehr.service;

import java.sql.SQLException;

import com.pcwk.ehr.cmn.BookmarkVO;
import com.pcwk.ehr.domain.UserVO;

public interface BookmarkService {
	int addBookmark(BookmarkVO vo) throws SQLException;

	int deleteBookmark(BookmarkVO vo) throws SQLException;

	int countBookmark(BookmarkVO vo) throws SQLException;
	
	int checkBookmark(BookmarkVO vo)throws SQLException;
}
