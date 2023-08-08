package com.pcwk.ehr.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pcwk.ehr.cmn.BookmarkVO;
import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.dao.BookmarkDao;
import com.pcwk.ehr.domain.UserVO;

@Service
public class BookmarkServiceImpl implements BookmarkService, PcwkLogger {

	@Autowired
	private BookmarkDao bookmarkDao;

	@Override
	public int addBookmark(BookmarkVO vo) throws SQLException {
		return bookmarkDao.addBookmark(vo);
	}

	@Override
	public int deleteBookmark(BookmarkVO vo) throws SQLException {
		return bookmarkDao.deleteBookmark(vo);
	}

}
