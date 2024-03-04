package com.pcwk.ehr.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.PcwkLogger;


@Repository("AdminTermsofuseDao")			// Spring의 Repository 어노테이션으로, 이 클래스가 데이터 액세스 객체 (DAO) 역할을 수행함을 나타낸다.
public class AdminTermsofuseDaoImpl implements AdminTermsofuseDao, PcwkLogger{
	
	private static final String NAMESPACE="com.pcwk.ehr.admintermsofusepage";	// MyBatis 매퍼에서 SQL 구문을 호출하기 위한 네임스페이스를 나타낸다.
	final String DOT = ".";
	
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;	// MyBatis의 SqlSession을 편리하게 사용하기 위한 Spring 클래스이다. 데이터베이스와의 상호 작용을 처리한다.
	
	
	public AdminTermsofuseDaoImpl() {}

	
	/**
	 * 데이터베이스에서 게시판 데이터를 로드하는 메서드이다.
	 */
	@Override
	public List<AdminPageVO> loadtermsofuse() throws SQLException {
		
		List<AdminPageVO> outVO = new ArrayList<AdminPageVO>();	
		String statement = NAMESPACE + DOT + "loadtermsofuse";	// MyBatis 매퍼 파일에서 실행할 SQL 구문을 나타내는 문자열이다.
		
		// 로그 출력
        LOG.debug("┌──────────────────────────┐");
        LOG.debug("│ 1. statement-            │" + statement);
        LOG.debug("└──────────────────────────┘");
        
        outVO = this.sqlSessionTemplate.selectList(statement);	// MyBatis의 selectList 메서드를 사용하여 데이터베이스에서 결과 리스트를 가져온다.
        
        LOG.debug("┌───────────────────────────┐");
        LOG.debug("│ 2. Check outVO            │" + outVO);
        LOG.debug("└───────────────────────────┘");
        
		return outVO;											// 데이터베이스에서 가져온 결과를 반환합니다.
	}
}






