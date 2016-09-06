package com.yxt.jhonelee.controller;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
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
		map.addAttribute("menu",new ITVVideoMenu());
		map.addAttribute("codevalue", codevalue);
		return "/itvideomenu";
	}
	@RequestMapping("/insert")
	public void insertVideo(@ModelAttribute ITVVideoMenu menu,PrintWriter writer){
		
		Date date = new Date();
		menu.setmCreatetime(date);
		menu.setmState(1);
		int insertFlag = service.AddVideoMenu(menu);
		if(insertFlag>0){
			writer.write("添加成功");
		}else{
			writer.write("添加失败");
		}
		
	}
	@RequestMapping("/update")
	public void updateVideo(ITVVideoMenu menu,PrintWriter writer){

		Date date = new Date();
		menu.setmCreatetime(date);
		menu.setmState(1);
		int update = service.UpdateVideoMenu(menu);
		
		if(update>0){
			writer.write("更新成功");
		}else{
			writer.write("更新失败");
		}
	}
	@RequestMapping("/deletes")
	public void deUpdate(@RequestParam(value="id")int mId,@RequestParam(value="state")int state,PrintWriter writer){
		int deupdate = service.DeleteVideoMenu(state, mId);
		if(deupdate>0){
			writer.write("禁用成功");
		}else{
			writer.write("禁用失败");
		}
	}
}
