package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pcwk.ehr.cmn.BookmarkVO;
import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.dao.BookmarkDao;
import com.pcwk.ehr.domain.UserVO;

@Service("BookmarkService")
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

	@Override
	public int countBookmark(BookmarkVO vo) throws SQLException {
		return bookmarkDao.countBookmark(vo);
	}

	@Override
	public int checkBookmark(BookmarkVO vo) throws SQLException {
		return bookmarkDao.checkBookmark(vo);
	}

	@Override
	public List<BookmarkVO> loadBookmark(BookmarkVO vo) throws SQLException {
		return bookmarkDao.loadBookmark(vo);
	}

}
