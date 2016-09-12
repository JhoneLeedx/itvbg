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
public class ITVAddressServiceImpl implements ITVAddressService{

	@Resource
	private ITVAddressDao  dao;
	public List<ITVAddress> AllITVAddress() {
		return dao.AllITVAddress();
	}
	public Integer UpdateItvAddress(ITVAddress itvAddress) {
		return dao.UpdateItvAddress(itvAddress);
	}
	public int getCount() {
		// TODO Auto-generated method stub
		return dao.getCount();
	}
}
