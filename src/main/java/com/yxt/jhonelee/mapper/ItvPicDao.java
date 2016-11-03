package com.yxt.jhonelee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yxt.jhonelee.model.ItvPicture;

public interface ItvPicDao {

	public List<ItvPicture> ItvPicList(@Param(value="mType")int mType,@Param(value="startPos")int startPos,@Param(value="pageSize")int pageSize);
	
	public int ItvPicListCount(int mType);
	
	public int UpdateItvPic(ItvPicture itvPicture);
	
	public ItvPicture OneItvPic(int mId);
}
