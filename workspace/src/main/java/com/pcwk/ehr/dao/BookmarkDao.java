package com.pcwk.ehr.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.cmn.BookmarkVO;
import com.pcwk.ehr.domain.UserVO;

public interface BookmarkDao {

	/**
     * 북마크를 추가하는 메소드
     *
     * @param vo 북마크 정보 객체
     * @return 성공여부 flag / 1:성공 0:실패
     * @throws SQLException 데이터베이스 관련 예외 발생 시
     */
    int addBookmark(BookmarkVO vo) throws SQLException;

    /**
     * 북마크를 삭제하는 메소드
     *
     * @param vo 북마크 정보 객체
     * @return 성공여부 flag / 1:성공 0:실패
     * @throws SQLException 데이터베이스 관련 예외 발생 시
     */
    int deleteBookmark(BookmarkVO vo) throws SQLException;

    /**
     * 사용자의 북마크 개수를 조회하는 메소드
     *
     * @param vo 사용자 정보 객체
     * @return 사용자의 북마크 개수
     * @throws SQLException 데이터베이스 관련 예외 발생 시
     */
    int countBookmark(BookmarkVO vo) throws SQLException;

    /**
     * 특정 주식에 대한 북마크 여부를 확인하는 메소드
     *
     * @param vo 북마크 정보 객체
     * @return 북마크 여부 flag / 1:가지고있음 0:가지고있지않음
     * @throws SQLException 데이터베이스 관련 예외 발생 시
     */
    int checkBookmark(BookmarkVO vo) throws SQLException;
    
    /**
     * 관심목록에 등록되어있는 주식종목코드를 불러오는 메소드
     * @param vo 사용자 정보 객체
     * @return 사용자가 가지고있는 관심목록
     * @throws SQLException
     */
    List<BookmarkVO> loadBookmark(BookmarkVO vo) throws SQLException;
}
