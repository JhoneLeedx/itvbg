package com.yxt.jhonelee.mapper;

import java.util.List;

import com.yxt.jhonelee.model.Address;

public interface AddressDao {

	public List<Address> SelectAddress(String mCodeValue);
}
