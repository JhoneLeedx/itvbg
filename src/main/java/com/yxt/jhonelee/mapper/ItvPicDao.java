package com.yxt.jhonelee.mapper;

import java.util.List;

import com.yxt.jhonelee.model.ItvPicture;

public interface ItvPicDao {

	public List<ItvPicture> ItvPicList();
	
	public int UpdateItvPic(ItvPicture itvPicture);
}
