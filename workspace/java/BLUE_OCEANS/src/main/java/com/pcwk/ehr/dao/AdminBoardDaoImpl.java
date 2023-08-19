package com.pcwk.ehr.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.cmn.AdminPageVO;
import com.pcwk.ehr.cmn.PcwkLogger;

@Repository("AdminBoardDao")
public class AdminBoardDaoImpl implements AdminBoardDao, PcwkLogger {
	private static final String NAMESPACE = "com.pcwk.ehr.adminpage";
	final String DOT = ".";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate; // DB 연결객체

	public AdminBoardDaoImpl() {
	}

	

}
