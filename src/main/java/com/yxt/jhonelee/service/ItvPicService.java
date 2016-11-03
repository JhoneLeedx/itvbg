package com.yxt.jhonelee.service;

import java.util.List;


import com.yxt.jhonelee.model.ItvPicture;

public interface ItvPicService {
	
	public List<ItvPicture> ItvPicList(int mType,int startPos,int pageSize);
	
	public int ItvPicListCount(int mType);
	
	public int UpdateItvPic(ItvPicture itvPicture);
	
	public ItvPicture OneItvPic(int mId);
}
