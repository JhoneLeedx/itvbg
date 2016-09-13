package com.yxt.jhonelee.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yxt.jhonelee.service.ItvStbService;
import com.yxt.jhonelee.util.Page;


@RequestMapping("/itvstb")
@Controller
public class ItvStbController {

	@Autowired
	private ItvStbService service;
	
	
	@RequestMapping("/all")
	public String allStb(HttpServletRequest request){
		String pageNow = request.getParameter("pageNow");
		Page page = null;
		if(pageNow!=null){
			
		}
		service.AllItvStb(page.getStartPos(), page.getPageSize());
		return "settopbox";
	}
}
