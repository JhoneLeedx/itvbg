package com.yxt.jhonelee.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yxt.jhonelee.model.ITVAddress;
import com.yxt.jhonelee.service.ITVAddressService;

@RequestMapping("/address")
@Controller
public class ITVAddressController {

	@Autowired
	private ITVAddressService service;
	
	@RequestMapping("/showAddress")
	public String getAddress(HttpServletRequest request){
		
		List<ITVAddress> list = service.AllITVAddress();
		request.setAttribute("list", list);
		return "/main";
	}
	
}
