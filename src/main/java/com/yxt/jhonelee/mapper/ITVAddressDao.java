package com.yxt.jhonelee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yxt.jhonelee.model.ITVAddress;

public interface ITVAddressDao {

	public List<ITVAddress> AllITVAddress(@Param(value="startPos")int startPos,@Param(value="pageSize")int pageSize);
	public Integer UpdateItvAddress(ITVAddress itvAddress);
	public int getCount();
}
