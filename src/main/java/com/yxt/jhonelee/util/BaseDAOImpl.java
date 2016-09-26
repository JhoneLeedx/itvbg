package com.yxt.jhonelee.util;

import org.mybatis.spring.SqlSessionTemplate;

public class BaseDAOImpl {
     private SqlSessionTemplate sessionTemplate = null;

	public SqlSessionTemplate getSessionTemplate() {
		return sessionTemplate;
	}

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
     
}
