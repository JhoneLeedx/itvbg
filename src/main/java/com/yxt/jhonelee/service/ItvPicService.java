package com.yxt.jhonelee.service;

import java.util.List;

import com.yxt.jhonelee.model.ItvPicture;

public interface ItvPicService {
	
	public List<ItvPicture> ItvPicList();
	
	public int UpdateItvPic(ItvPicture itvPicture);
}
