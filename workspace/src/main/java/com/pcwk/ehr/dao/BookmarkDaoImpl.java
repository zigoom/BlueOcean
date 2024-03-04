package com.pcwk.ehr.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.cmn.BookmarkVO;

@Repository("BookmarkDao")
public class BookmarkDaoImpl implements BookmarkDao, PcwkLogger {
    private static final String NAMESPACE = "com.pcwk.ehr.bookmark";
    final String DOT = ".";

    @Autowired
    SqlSessionTemplate sqlSessionTemplate; // DB 연결객체

    public BookmarkDaoImpl() {
    }

    // 북마크를 추가하는 메소드
    @Override
    public int addBookmark(BookmarkVO vo) throws SQLException {
        int flag = 0;
        if (countBookmark(vo) < 10) {
            if (checkBookmark(vo) == 0) {
                String statement = NAMESPACE + DOT + "addBookmark";
                // 로그 출력
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
            } else {
                LOG.debug("중복되는 종목");
                flag = 3;
            }
        } else {
            LOG.debug("10개 초과");
            flag = 2;
        }

        return flag;
    }

    // 북마크를 삭제하는 메소드
    @Override
    public int deleteBookmark(BookmarkVO vo) throws SQLException {
        int flag = 0;

        String statement = NAMESPACE + DOT + "deleteBookmark";
        // 로그 출력
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

    // 사용자의 북마크 개수를 조회하는 메소드
    @Override
    public int countBookmark(BookmarkVO vo) throws SQLException {
        int flag = 0;

        String statement = NAMESPACE + DOT + "countBookmark";
        // 로그 출력
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

    // 특정 주식에 대한 북마크 여부를 확인하는 메소드
    @Override
    public int checkBookmark(BookmarkVO vo) throws SQLException {
        int flag = 0;

        String statement = NAMESPACE + DOT + "checkBookmark";
        // 로그 출력
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

	
    
    // 사용자의 관심목록을 불러오는 메소드
    @Override
	public List<BookmarkVO> loadBookmark(BookmarkVO vo) throws SQLException {
    	List<BookmarkVO> outVO = new ArrayList<BookmarkVO>();
    	String statement = NAMESPACE + DOT + "loadBookmark";
        // 로그 출력
    	LOG.debug("┌──────────────────────────┐");
        LOG.debug("│ 1. statement-            │" + statement);
        LOG.debug("└──────────────────────────┘");
        LOG.debug("┌──────────────────────────┐");
        LOG.debug("│ 2. param=\n              │" + vo.toString());
        LOG.debug("└──────────────────────────┘");
        outVO = this.sqlSessionTemplate.selectList(statement, vo);
        LOG.debug("┌──────────────────────────┐");
        LOG.debug("│ 3. Check outVO           │" + outVO);
        LOG.debug("└──────────────────────────┘");
		return outVO;
	}
}
