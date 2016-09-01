package com.yxt.jhonelee.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.yxt.jhonelee.model.Address;
import com.yxt.jhonelee.service.AddressService;


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
}
