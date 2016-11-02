package com.yxt.jhonelee.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yxt.jhonelee.mapper.ITVAddressDao;
import com.yxt.jhonelee.model.ITVAddress;
import com.yxt.jhonelee.service.ITVAddressService;

@Transactional
@Service
public class ITVAddressServiceImpl implements ITVAddressService {

	@Resource
	private ITVAddressDao dao;

	public List<ITVAddress> AllITVAddress(int startPos, int pageSize) {
		return dao.AllITVAddress(startPos, pageSize);
	}

	public Integer UpdateItvAddress(ITVAddress itvAddress) {
		return dao.UpdateItvAddress(itvAddress);
	}

	public int getCount() {
		return dao.getCount();
	}

	public ITVAddress SecOneItvAddress(String mAreaCode) {
		return dao.SecOneItvAddress(mAreaCode);
	}

	public int delAddress(String mAreaCode, int mState) {
		return dao.delAddress(mAreaCode, mState);
	}

	public ITVAddress SecAddress(int mId) {
		// TODO Auto-generated method stub
		return dao.SecAddress(mId);
	}
}
