package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.dao.CodeDao;
import com.pcwk.ehr.domain.CodeVO;

@Service
public class CodeServiceImpl implements CodeService {

	@Autowired
	CodeDao codeDao;
	
	
	@Override
	public int doSave(CodeVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int doDelete(CodeVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int doUpdate(CodeVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CodeVO doSelectOne(CodeVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CodeVO> doRetrieve(CodeVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return codeDao.doRetrieve(inVO);
	}

}
