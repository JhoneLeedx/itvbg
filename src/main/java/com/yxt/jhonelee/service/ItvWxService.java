package com.yxt.jhonelee.service;

import java.util.List;


import com.yxt.jhonelee.model.ItvWxpublic;

public interface ItvWxService {
	
	public List<ItvWxpublic> SelectWx(int startPos, int pageSize);

	public int selectWxCount();
	
	public List<ItvWxpublic> SelectWxall();
	
	public int AddWxpublic(ItvWxpublic itvWxpublic);
	
	
	public ItvWxpublic oneWxpublic(int mId);
	
	public int updateWx(ItvWxpublic itvWxpublic);
	
	public int updateWxState(int mId,int mState);
}
