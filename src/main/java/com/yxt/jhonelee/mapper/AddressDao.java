package com.yxt.jhonelee.mapper;

import java.util.List;

import com.yxt.jhonelee.model.Address;

public interface AddressDao {

	public List<Address> SelectAddress(String mCodeValue);//查出所有pid等于codevalue的address;
	public Address SelectParentAddress(int mId);//通过当前地址的id查出他对应的父级地址
	public Address SelectOneAddress(int mId);//通过id查出地址
	public Address SelectOAddress(String mCodeValue);//通过code_value查出地址
}
