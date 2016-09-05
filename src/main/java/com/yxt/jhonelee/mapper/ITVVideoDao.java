package com.yxt.jhonelee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yxt.jhonelee.model.ITVVideoMenu;

public interface ITVVideoDao {

	public List<ITVVideoMenu> AllItvVideoMenu(String mAreaCode);
	public int AddVideoMenu(ITVVideoMenu menu);
	public int UpdateVideoMenu(ITVVideoMenu menu);
	public int DeleteVideoMenu(@Param(value="state")int mState,@Param(value="mId")int mId);
}
