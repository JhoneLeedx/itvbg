package com.yxt.jhonelee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yxt.jhonelee.model.ITVVideoMenu;
import com.yxt.jhonelee.service.ItvVideoMenuService;

@RequestMapping("/itvmenu")
@Controller
public class ItvVideoMenuController {

	
	@Autowired
	private ItvVideoMenuService service;
	
	@RequestMapping("/allMenu")
	public String AllVideoMenu(@RequestParam(value="codevalue")String codevalue,@RequestParam(value="shortname")String shortname,ModelMap map){ 
		List<ITVVideoMenu> list=service.AllItvVideoMenu(codevalue);
		map.addAttribute("menuList", list);
		map.addAttribute("shortName", shortname);
		return "/itvideomenu";
	}
	
}
