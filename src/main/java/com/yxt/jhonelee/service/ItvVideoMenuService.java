package com.yxt.jhonelee.service;

import java.util.List;

import com.yxt.jhonelee.model.ITVVideoMenu;

public interface ItvVideoMenuService {
	
	public List<ITVVideoMenu> AllItvVideoMenu(String mAreaCode, int startPos, int pageSize);

	public int AddVideoMenu(ITVVideoMenu menu);

	public int UpdateVideoMenu(ITVVideoMenu menu);

	public int DeleteVideoMenu(int mState, int mId);

	public int getCount(String codevalue);

	public ITVVideoMenu QueryOneVideMenu(int mId);
}
