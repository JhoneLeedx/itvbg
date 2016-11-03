package com.yxt.jhonelee.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.yxt.jhonelee.model.Address;
import com.yxt.jhonelee.service.AddressService;

/**
 * 
 * @author JhoneLee
 *    三级联动控制器
 */
@RequestMapping("/addresstll")
@Controller
public class AddressTLLController {

	@Autowired
	private AddressService service;
	
	@RequestMapping("/alist")
	public void getAddessList(HttpServletRequest request,PrintWriter writer){
		String pid = request.getParameter("codevalue");
		List<Address> list = null;
		if(pid==null){
			list = service.SelectAddress("156");
		}else{
			list = service.SelectAddress(pid);
		}
		Gson gson = new Gson();
		String json = gson.toJson(list);
		writer.write(json);
	}
	
	@RequestMapping("/parentAddress")
	public void getParentAddress(@RequestParam(value="id")int mId,PrintWriter writer){
		
		Address townAddress = service.SelectOneAddress(mId);
		Address cityAddress = service.SelectParentAddress(mId);
		Address provinceAddress = service.SelectParentAddress(cityAddress.getmId());
		List<Address> list = new ArrayList<Address>();
		list.add(provinceAddress);
		list.add(cityAddress);
	    list.add(townAddress);
		Gson gson = new Gson();
		String json = gson.toJson(list);
		writer.write(json);
	}
	
	@RequestMapping("parentsAddress")
	public void getParentAddress(@RequestParam(value="codevalue")String mCodeValue,PrintWriter writer){
		Address townAddress = service.SelectOneAddress(mCodeValue);
		Address cityAddress = service.SelectParentAddress(townAddress.getmId());
		Address provinceAddress = service.SelectParentAddress(cityAddress.getmId());
		List<Address> list = new ArrayList<Address>();
		list.add(provinceAddress);
		list.add(cityAddress);
	    list.add(townAddress);
		Gson gson = new Gson();
		String json = gson.toJson(list);
		writer.write(json);
	}
}
