package com.yxt.jhonelee.service;

import java.util.List;

import com.yxt.jhonelee.model.Address;

public interface AddressService {
	
	public List<Address> SelectAddress(String mCodeValue);
	
	public Address SelectParentAddress(int mId);
	public Address SelectOneAddress(int mId);
	public Address SelectOneAddress(String mCodeValue);
}
