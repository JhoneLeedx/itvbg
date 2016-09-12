package com.yxt.jhonelee.mapper;

import java.util.List;

import com.yxt.jhonelee.model.ITVAddress;

public interface ITVAddressDao {

	public List<ITVAddress> AllITVAddress();
	public Integer UpdateItvAddress(ITVAddress itvAddress);
	public int getCount();
}
