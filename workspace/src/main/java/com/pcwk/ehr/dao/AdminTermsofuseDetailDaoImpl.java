package com.pcwk.ehr.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.PcwkLogger;


@Repository("AdminTermsofuseDetailDao")			// Spring의 Repository 어노테이션으로, 이 클래스가 데이터 액세스 객체 (DAO) 역할을 수행함을 나타낸다.
public class AdminTermsofuseDetailDaoImpl implements AdminTermsofuseDetailDao, PcwkLogger{
	
	private static final String NAMESPACE="com.pcwk.ehr.admintermsofusepage";	// MyBatis 매퍼에서 SQL 구문을 호출하기 위한 네임스페이스를 나타낸다.
	final String DOT = ".";
	
	
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;	// MyBatis의 SqlSession을 편리하게 사용하기 위한 Spring 클래스이다. 데이터베이스와의 상호 작용을 처리한다.
	
	
	public AdminTermsofuseDetailDaoImpl() {}

	
	/**
	 * 데이터베이스에서 이용약관 데이터를 로드하는 메서드이다.
	 */
	@Override
	public AdminPageVO loadTermsofuseDetail(AdminPageVO inVO) throws SQLException {
		
        LOG.debug("┌──────────────────────────────────┐");
        LOG.debug("│loadTermsofuseDetailDaoImpl       │");
        LOG.debug("└──────────────────────────────────┘");
        
		return sqlSessionTemplate.selectOne(NAMESPACE+DOT+"loadTermsofuseDetail",inVO);
	}


	@Override
	public int termsofuseUpdate(AdminPageVO vo) throws SQLException {
		LOG.debug("┌──────────────────────────────────┐");
        LOG.debug("│termsofuseUpdateDaoImpl           │");
        LOG.debug("└──────────────────────────────────┘");
        
		return sqlSessionTemplate.update(NAMESPACE+DOT+"termsofuseUpdate",vo);
	}


	@Override
	public int termsofuseDelete(AdminPageVO vo) throws SQLException {
		LOG.debug("┌──────────────────────────────────┐");
        LOG.debug("│termsofuseUpdateDaoImpl           │");
        LOG.debug("│AdminPageVO vo		              │" + vo);
        LOG.debug("└──────────────────────────────────┘");
		
		return sqlSessionTemplate.delete(NAMESPACE+DOT+"termsofuseDelete",vo);
	}

	
}






