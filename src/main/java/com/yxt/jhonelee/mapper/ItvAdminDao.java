package com.yxt.jhonelee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yxt.jhonelee.model.Admin;

public interface ItvAdminDao {
	
     public Admin LoginAdmin(@Param(value="mAdminName")String mAdminName,@Param(value="mPass")String mPass);//登录接口
     
     public List<Admin> AllItvAdmin(@Param(value="startPos")int startPos,@Param(value="pageSize")int pageSize);//显示所有的管理员
     
     public int updateAdmin(Admin admin);//更新管理员信息
     
     public int AddAdmin(Admin admin);	//添加管理员信息
     
     public int getCount();//获得总数
     
     public int delAdmin(int mId);//删除id的数据
}
