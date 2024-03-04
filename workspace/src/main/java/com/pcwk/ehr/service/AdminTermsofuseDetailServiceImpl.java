package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.dao.AdminTermsofuseDetailDao;

@Service("AdminTermsofuseDetailService")				// Spring의 Service 어노테이션으로, 이 클래스가 비즈니스 로직을 처리하는 서비스 역할을 수행함을 나타낸다.
public class AdminTermsofuseDetailServiceImpl implements AdminTermsofuseDetailService, PcwkLogger{

	@Autowired									// Spring의 의존성 주입(Dependency Injection) 어노테이션으로, AdminBoardDao 객체를 자동으로 주입한다.
	AdminTermsofuseDetailDao adminTermsofuseDetailDao;		// AdminTermsofuseDao 인터페이스를 사용하여 데이터베이스와 상호 작용하는 DAO 객체를 참조한다.
	
	/**
	 * 이용약관 상세 데이터를 로드하는 메소드이다. 
	 * 이 메서드는 AdminTermsofuseDetailDao의 loadTermsofuseDetail() 메서드를 호출하여 데이터베이스에서 데이터를 가져온다.
	 */
	@Override
	public AdminPageVO loadTermsofuseDetail(AdminPageVO inVO) throws SQLException {
		// 로그 출력
        LOG.debug("┌──────────────────────────────────┐");
        LOG.debug("│ ServiceImpl_loadtermsofuseDetail │");
        LOG.debug("└──────────────────────────────────┘");
        
		return adminTermsofuseDetailDao.loadTermsofuseDetail(inVO);
	}
	
	/**
	 * 이용약관 수정을 로드하는 메소드이다.
	 */
	@Override
	public int termsofuseUpdate(AdminPageVO vo) throws SQLException {
		// 로그 출력
        LOG.debug("┌──────────────────────────────────┐");
        LOG.debug("│ ServiceImpl_termsofuseUpdate     │");
        LOG.debug("└──────────────────────────────────┘");
        
		return adminTermsofuseDetailDao.termsofuseUpdate(vo);
	}
	
	/**
	 * 이용약관 삭제를 로드하는 메소드이다.
	 */
	@Override
	public int termsofuseDelete(AdminPageVO vo) throws SQLException {
		// 로그 출력
        LOG.debug("┌──────────────────────────────────┐");
        LOG.debug("│ ServiceImpl_termsofuseDelete     │");
        LOG.debug("│ AdminPageVO vo				      │" + vo);
        LOG.debug("└──────────────────────────────────┘");
        
		return adminTermsofuseDetailDao.termsofuseDelete(vo);
	}
	
	
}
