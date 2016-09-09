package com.yxt.jhonelee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yxt.jhonelee.model.Admin;

public interface ItvAdminDao {
	
     public Admin LoginAdmin(@Param(value="mAdminName")String mAdminName,@Param(value="mPass")String mPass);
     
     public List<Admin> AllItvAdmin();
     
     public int updateAdmin();
}
