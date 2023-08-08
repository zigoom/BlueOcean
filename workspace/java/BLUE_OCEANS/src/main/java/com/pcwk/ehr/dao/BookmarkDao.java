package com.pcwk.ehr.dao;

import java.sql.SQLException;

import com.pcwk.ehr.cmn.BookmarkVO;
import com.pcwk.ehr.domain.UserVO;

public interface BookmarkDao {
	int addBookmark(BookmarkVO vo)throws SQLException;
	
	int deleteBookmark(BookmarkVO vo)throws SQLException;
}
