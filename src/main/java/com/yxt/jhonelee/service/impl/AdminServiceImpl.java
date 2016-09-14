package com.yxt.jhonelee.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yxt.jhonelee.mapper.ItvAdminDao;
import com.yxt.jhonelee.model.Admin;
import com.yxt.jhonelee.service.AdminService;

@Service
@Transactional
public class AdminServiceImpl implements AdminService{

	@Resource
	private ItvAdminDao dao;
	public List<Admin> AllItvAdmin() {
		return dao.AllItvAdmin();
	}

	public int updateAdmin(Admin admin) {
		return dao.updateAdmin(admin);
	}

	public Admin LoginAdmin(String mAdminName, String mPass) {
		return dao.LoginAdmin(mAdminName, mPass);
	}

	
}
