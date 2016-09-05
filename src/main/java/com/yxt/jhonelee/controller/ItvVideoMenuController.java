package com.yxt.jhonelee.controller;

import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yxt.jhonelee.model.ITVVideoMenu;
import com.yxt.jhonelee.service.ItvVideoMenuService;

/**
 * 
 * @author JhoneLee
 *   itv视频菜单管理控制器
 */
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
	@RequestMapping("/insert")
	public void insertVideo(ITVVideoMenu menu){
		int insertFlag = service.AddVideoMenu(menu);
		if(insertFlag>0){
			
		}else{
			
		}
		
	}
	@RequestMapping("/update")
	public void updateVideo(ITVVideoMenu menu){
		int update = service.UpdateVideoMenu(menu);
		if(update>0){
			
		}else{
			
		}
	}
	@RequestMapping("/delete")
	public void deUpdate(@RequestParam(value="id")int mId,@RequestParam(value="state")int state,PrintWriter writer){
		int deupdate = service.DeleteVideoMenu(state, mId);
		if(deupdate>0){
			writer.write("禁用成功");
		}else{
			writer.write("禁用失败");
		}
	}
}
