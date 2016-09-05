package com.yxt.jhonelee.service;

import java.util.List;

import com.yxt.jhonelee.model.ITVVideoMenu;

public interface ItvVideoMenuService {
	public List<ITVVideoMenu> AllItvVideoMenu(String mAreaCode);
	public int AddVideoMenu(ITVVideoMenu menu);
	public int UpdateVideoMenu(ITVVideoMenu menu);
	public int DeleteVideoMenu(int mState,int mId);
}
