package com.yxt.jhonelee.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yxt.jhonelee.mapper.ITVVideoDao;
import com.yxt.jhonelee.model.ITVVideoMenu;
import com.yxt.jhonelee.service.ItvVideoMenuService;

@Transactional
@Service
public class ItvVideoMenuServiceImpl  implements ItvVideoMenuService{

	@Resource
	private ITVVideoDao dao;
	
	public List<ITVVideoMenu> AllItvVideoMenu(String mAreaCode) {
		// TODO Auto-generated method stub
		return dao.AllItvVideoMenu(mAreaCode);
	}

	public int AddVideoMenu(ITVVideoMenu menu) {
		// TODO Auto-generated method stub
		return dao.AddVideoMenu(menu);
	}

	public int UpdateVideoMenu(ITVVideoMenu menu) {
		// TODO Auto-generated method stub
		return dao.UpdateVideoMenu(menu);
	}

	public int DeleteVideoMenu(int mState,int mId) {
		// TODO Auto-generated method stub
		return dao.DeleteVideoMenu(mState,mId);
	}

}
