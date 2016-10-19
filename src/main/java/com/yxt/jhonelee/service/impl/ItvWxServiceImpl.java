package com.yxt.jhonelee.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yxt.jhonelee.mapper.ItvWxpublicDao;
import com.yxt.jhonelee.model.ItvWxpublic;
import com.yxt.jhonelee.service.ItvWxService;

@Transactional
@Service
public class ItvWxServiceImpl implements ItvWxService {

	@Resource
	private ItvWxpublicDao dao;

	public List<ItvWxpublic> SelectWx(int startPos, int pageSize) {
		return dao.SelectWx(startPos, pageSize);
	}

	public int selectWxCount() {
		// TODO Auto-generated method stub
		return dao.selectWxCount();
	}

	public int AddWxpublic(ItvWxpublic itvWxpublic) {
		// TODO Auto-generated method stub
		return dao.AddWxpublic(itvWxpublic);
	}

	public ItvWxpublic oneWxpublic(int mId) {
		// TODO Auto-generated method stub
		return dao.oneWxpublic(mId);
	}

	public int updateWx(ItvWxpublic itvWxpublic) {
		// TODO Auto-generated method stub
		return dao.updateWx(itvWxpublic);
	}

	public int updateWxState(int mId, int mState) {
		// TODO Auto-generated method stub
		return dao.updateWxState(mId, mState);
	}

	public List<ItvWxpublic> SelectWxall() {
		// TODO Auto-generated method stub
		return dao.SelectWxall();
	}

}
