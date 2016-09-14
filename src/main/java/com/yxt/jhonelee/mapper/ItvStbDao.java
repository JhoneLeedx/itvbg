package com.yxt.jhonelee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yxt.jhonelee.model.ItvSTB;

public interface ItvStbDao {

	public List<ItvSTB> AllItvStb(@Param(value = "startPos") int startPos, @Param(value = "pageSize") int pageSize);// 得到分页下的所有数据

	public int getCount();// 得到总数
	
	public int deleteSTB(int mId);//删除id对应的数据
	
	public int updateSTB(ItvSTB itvstb);//更新id对应的数据
	

}
