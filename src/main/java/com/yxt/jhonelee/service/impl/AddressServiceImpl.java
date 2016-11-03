package com.yxt.jhonelee.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yxt.jhonelee.mapper.AddressDao;
import com.yxt.jhonelee.model.Address;
import com.yxt.jhonelee.service.AddressService;

@Transactional
@Service
public class AddressServiceImpl implements AddressService {

	@Resource
	private AddressDao dao;
	
	
	public List<Address> SelectAddress(String mCodeValue) {
		return dao.SelectAddress(mCodeValue);
	}
	public Address SelectParentAddress(int mId) {
		return dao.SelectParentAddress(mId);
	}
	public Address SelectOneAddress(int mId) {
		return dao.SelectOneAddress(mId);
	}
	public Address SelectOneAddress(String mCodeValue) {
		// TODO Auto-generated method stub
		return dao.SelectOAddress(mCodeValue);
	}

}
