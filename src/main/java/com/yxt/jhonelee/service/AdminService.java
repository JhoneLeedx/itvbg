package com.yxt.jhonelee.service;

import java.util.List;

import com.yxt.jhonelee.model.Admin;

public interface AdminService {
	
	public Admin LoginAdmin(String mAdminName, String mPass);

	public List<Admin> AllItvAdmin();

	public int updateAdmin(Admin admin);
}
