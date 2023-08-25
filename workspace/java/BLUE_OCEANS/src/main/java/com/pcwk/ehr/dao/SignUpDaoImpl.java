package com.pcwk.ehr.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.domain.UserVO;
import com.pcwk.ehr.service.SignUpService;

@Repository
public class SignUpDaoImpl<TermsOfUseVO> implements SignUpDao, PcwkLogger {

	private static final String NAMESPACE = "com.pcwk.ehr.signup";
	private static final String DOT = ".";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate; // DB연결 객체
	
	@Autowired
	SignUpService signUpService;

	// **** default 생성
	public SignUpDaoImpl() {
	}

	@Override
	public int add(UserVO userVO) throws SQLException, ClassNotFoundException {

		int flag = 0;
		int add_flag = 0;
		

		String member = this.NAMESPACE + DOT + "add";
		LOG.debug("┌─────────────────┐");
		LOG.debug("│DaoImpl구역       │" + member);
		LOG.debug("└─────────────────┘");
		LOG.debug("SignUpVO 값 ==" + userVO.toString());

		add_flag = this.sqlSessionTemplate.insert(member, userVO);

		// otp 함수 호출
		int otp_flag = otp(userVO);

		// agree 함수 호출
		int agree_flag = signUpService.agree(userVO);
		
		int totalCount = getTotalTermsOfUseCount();
				

		 LOG.debug("add flag 값 = " + add_flag); 
		 LOG.debug("otp flag 값 = " + otp_flag);
		 LOG.debug("agree flag 값 = " + agree_flag);
		 LOG.debug("totalCount 값 = " + totalCount);

			if (add_flag == 1 && otp_flag == 1 && agree_flag == totalCount) {
				flag = 1;
			} else {
				flag = 0;
			}
		 

		LOG.debug("DaoImple flag 값 = " + flag);

		return flag;

	}

	// 아이디 중복 검사
	public int idCheck(String userId) throws Exception {

		String statementtwo = this.NAMESPACE + DOT + "idCheck";

		int cnt = sqlSessionTemplate.selectOne(statementtwo, userId);

		return cnt;

	}

	@Override
	public int otp(UserVO userVO) {

		String otp = this.NAMESPACE + DOT + "otp";

		LOG.debug("┌─────────────────┐");
		LOG.debug("│DaoImpl구역       │" + otp);
		LOG.debug("└─────────────────┘");
		LOG.debug("otp 값 ==" + userVO.toString());

		int otp_flag = this.sqlSessionTemplate.insert(otp, userVO);

		return otp_flag;
	}

	@Override
	public int agree(UserVO userVO) {
		String agree = this.NAMESPACE + DOT + "agree";

		LOG.debug("┌─────────────────┐");
		LOG.debug("│DaoImpl구역                 │" + agree);
		LOG.debug("└─────────────────┘");
		LOG.debug("agree 값 ==" + userVO.toString());

		int agree_cnt = this.sqlSessionTemplate.insert(agree, userVO);

		return agree_cnt;
	}

	@Override
	public int getTotalTermsOfUseCount() {

		String count = this.NAMESPACE + DOT + "count";

		LOG.debug("┌─────────────────┐");
		LOG.debug("│DaoImpl구역                 │" + count);
		LOG.debug("└─────────────────┘");
		LOG.debug("getTotalTermsOfUseCount 값 ==" + count.toString());

		int cnt = sqlSessionTemplate.selectOne(count);

		return cnt;
	}

	@Override
	public List<UserVO> doRetrieveTermsofuse(UserVO inVO) {
		String termsOfUse = this.NAMESPACE + DOT + "TERMSOFUSE";

		LOG.debug("┌─────────────────┐");
		LOG.debug("│DaoImpl구역                 │" + termsOfUse);
		LOG.debug("└─────────────────┘");
		LOG.debug("agree 값 ==" + inVO.toString());

		List<UserVO> termsOfUse_List = this.sqlSessionTemplate.selectList(termsOfUse, inVO);
		
		System.out.println(termsOfUse_List);

		return termsOfUse_List;
	}
	
	/*
	 * @Override public List<TermsOfUseVO> getTotalTermsOf(List<Integer>
	 * termOfUseNos) { String statement = NAMESPACE + ".TERMSOFUSE";
	 * 
	 * List<TermsOfUseVO> result = sqlSessionTemplate.selectList(statement,
	 * termOfUseNos);
	 * 
	 * LOG.debug("┌─────────────────┐"); LOG.debug("│ DaoImpl구역                 │" +
	 * statement); LOG.debug("└─────────────────┘");
	 * 
	 * return result; }
	 */

}
