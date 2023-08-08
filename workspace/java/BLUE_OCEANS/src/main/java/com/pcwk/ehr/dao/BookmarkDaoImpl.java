package com.pcwk.ehr.dao;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.domain.UserVO;
import com.pcwk.ehr.cmn.BookmarkVO;

@Repository
public class BookmarkDaoImpl implements BookmarkDao, PcwkLogger {
	private static final String NAMESPACE = "com.pcwk.ehr.bookmark";
	final String DOT = ".";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;// DB 연결객체

	public BookmarkDaoImpl() {
	}

	@Override
	public int addBookmark(BookmarkVO vo) throws SQLException {
		int flag = 0;
		if(countBookmark(vo) < 10) {
			if(checkBookmark(vo) == 0) {
				String statement = NAMESPACE + DOT + "addBookmark";
				LOG.debug("┌──────────────────────────┐");
				LOG.debug("│ 1. statement-            │" + statement);
				LOG.debug("└──────────────────────────┘");
				LOG.debug("┌──────────────────────────┐");
				LOG.debug("│ 2. param=\n              │" + vo.toString());
				LOG.debug("└──────────────────────────┘");
				flag = this.sqlSessionTemplate.insert(statement, vo);
				LOG.debug("┌──────────────────────────┐");
				LOG.debug("│ 3. Check flag            │" + flag);
				LOG.debug("└──────────────────────────┘");
			}else {
				LOG.debug("중복되는 종목");
				flag = 3;
			}
		}else {
			LOG.debug("10개 초과");
			flag = 2;
		}

		return flag;

	}

	@Override
	public int deleteBookmark(BookmarkVO vo) throws SQLException {
		int flag = 0;

		String statement = NAMESPACE + DOT + "deleteBookmark";
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 1. statement-            │" + statement);
		LOG.debug("└──────────────────────────┘");
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 2. param=\n              │" + vo.toString());
		LOG.debug("└──────────────────────────┘");
		flag = this.sqlSessionTemplate.delete(statement, vo);
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 3. Check flag            │" + flag);
		LOG.debug("└──────────────────────────┘");

		return flag;
	}

	@Override
	public int countBookmark(BookmarkVO vo) throws SQLException {
		int flag = 0;

		String statement = NAMESPACE + DOT + "countBookmark";
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 1. statement-            │" + statement);
		LOG.debug("└──────────────────────────┘");
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 2. param=\n              │" + vo.toString());
		LOG.debug("└──────────────────────────┘");
		flag = this.sqlSessionTemplate.selectOne(statement, vo);
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 3. Check flag            │" + flag);
		LOG.debug("└──────────────────────────┘");

		return flag;
	}

	@Override
	public int checkBookmark(BookmarkVO vo) throws SQLException {
		int flag = 0;

		String statement = NAMESPACE + DOT + "checkBookmark";
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 1. statement-            │" + statement);
		LOG.debug("└──────────────────────────┘");
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 2. param=\n              │" + vo.toString());
		LOG.debug("└──────────────────────────┘");
		flag = this.sqlSessionTemplate.selectOne(statement, vo);
		LOG.debug("┌──────────────────────────┐");
		LOG.debug("│ 3. Check flag            │" + flag);
		LOG.debug("└──────────────────────────┘");

		return flag;
	}

}
