package com.yxt.jhonelee.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yxt.jhonelee.mapper.ItvPicDao;
import com.yxt.jhonelee.model.ItvPicture;
import com.yxt.jhonelee.service.ItvPicService;

@Transactional
@Service
public class ItvPicServiceImpl implements ItvPicService{

	@Resource
	private ItvPicDao dao;
	


	public int UpdateItvPic(ItvPicture itvPicture) {
		return dao.UpdateItvPic(itvPicture);
	}

	public List<ItvPicture> ItvPicList(int mType, int startPos, int pageSize) {
		// TODO Auto-generated method stub
		return dao.ItvPicList(mType, startPos, pageSize);
	}

	public int ItvPicListCount(int mType) {
		// TODO Auto-generated method stub
		return dao.ItvPicListCount(mType);
	}

}
