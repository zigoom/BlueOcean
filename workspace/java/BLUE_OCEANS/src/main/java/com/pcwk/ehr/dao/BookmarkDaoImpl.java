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

		String statement = NAMESPACE + DOT + "addBookmark";
		System.out.println("┌──────────────────────────┐");
		System.out.println("│ 1. statement-            │" + statement);
		System.out.println("└──────────────────────────┘");
		System.out.println("┌──────────────────────────┐");
		System.out.println("│ 2. param=\n              │" + vo.toString());
		System.out.println("└──────────────────────────┘");
		flag = this.sqlSessionTemplate.insert(statement, vo);
		System.out.println("┌──────────────────────────┐");
		System.out.println("│ 3. idCheck flag  1/0     │" + flag);
		System.out.println("└──────────────────────────┘");

		return flag;

	}

	@Override
	public int deleteBookmark(BookmarkVO vo) throws SQLException {
		int flag = 0;

		String statement = NAMESPACE + DOT + "deleteBookmark";
		System.out.println("┌──────────────────────────┐");
		System.out.println("│ 1. statement-            │" + statement);
		System.out.println("└──────────────────────────┘");
		System.out.println("┌──────────────────────────┐");
		System.out.println("│ 2. param=\n              │" + vo.toString());
		System.out.println("└──────────────────────────┘");
		flag = this.sqlSessionTemplate.delete(statement, vo);
		System.out.println("┌──────────────────────────┐");
		System.out.println("│ 3. idCheck flag  1/0     │" + flag);
		System.out.println("└──────────────────────────┘");

		return flag;
	}

}
