package com.yxt.jhonelee.service;

import java.util.List;

import com.yxt.jhonelee.model.ITVAddress;

public interface ITVAddressService {
	public List<ITVAddress> AllITVAddress(int startPos,int pageSize);
	public Integer UpdateItvAddress(ITVAddress itvAddress);
	public int getCount();
}
