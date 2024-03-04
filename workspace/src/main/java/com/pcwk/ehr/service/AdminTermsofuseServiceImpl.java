
package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.dao.AdminTermsofuseDao;

@Service("AdminTermsofuseService")				// Spring의 Service 어노테이션으로, 이 클래스가 비즈니스 로직을 처리하는 서비스 역할을 수행함을 나타낸다.
public class AdminTermsofuseServiceImpl implements AdminTermsofuseService, PcwkLogger{

	@Autowired									// Spring의 의존성 주입(Dependency Injection) 어노테이션으로, AdminBoardDao 객체를 자동으로 주입한다.
	AdminTermsofuseDao adminTermsofuseDao;		// AdminTermsofuseDao 인터페이스를 사용하여 데이터베이스와 상호 작용하는 DAO 객체를 참조한다.
	
	/**
	 * 게시판 데이터를 로드하는 메서드이다. 
	 * 이 메서드는 AdminTermsofuseDao의 loadtermsofuse() 메서드를 호출하여 데이터베이스에서 데이터를 가져온다.
	 */
	@Override
	public List<AdminPageVO> loadtermsofuse() throws SQLException {
		
		// 로그 출력
        LOG.debug("┌────────────────────────────┐");
        LOG.debug("│ ServiceImpl_loadtermsofuse │");
        LOG.debug("└────────────────────────────┘");
        
		return adminTermsofuseDao.loadtermsofuse();
	}
	
	
}
