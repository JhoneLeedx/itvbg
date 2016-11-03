package com.yxt.jhonelee.service;

import java.util.List;

import com.yxt.jhonelee.model.Admin;

public interface AdminService {

	public Admin LoginAdmin(String mAdminName, String mPass);

	public List<Admin> AllItvAdmin(int startPos, int pageSize);

	public int updateAdmin(Admin admin);

	public int AddAdmin(Admin admin);

	public int getCount();
	
	public int delAdmin(int mId);
	
	 public Admin OneAdmin(int mId);
}
