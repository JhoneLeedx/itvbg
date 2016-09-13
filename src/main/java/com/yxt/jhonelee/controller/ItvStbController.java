package com.yxt.jhonelee.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yxt.jhonelee.model.ItvSTB;
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
		int count = service.getCount();
		if(pageNow!=null){
			page = new Page(count,Integer.parseInt(pageNow));
		}else{
			page = new Page(count,1);
		}
		List<ItvSTB> list = service.AllItvStb(page.getStartPos(), page.getPageSize());
		request.setAttribute("list", list);
		return "settopbox";
	}
}
