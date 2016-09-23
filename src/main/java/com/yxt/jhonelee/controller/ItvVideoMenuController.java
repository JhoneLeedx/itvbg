package com.yxt.jhonelee.controller;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yxt.jhonelee.model.Admin;
import com.yxt.jhonelee.model.ITVVideoMenu;
import com.yxt.jhonelee.service.ItvVideoMenuService;
import com.yxt.jhonelee.util.Page;

/**
 * 
 * @author JhoneLee itv视频菜单管理控制器
 */
@RequestMapping("/itvmenu")
@Controller
public class ItvVideoMenuController {

	@Autowired
	private ItvVideoMenuService service;

	@RequestMapping("/allMenu")
	public String AllVideoMenu(@RequestParam(value = "codevalue") String codevalue,
			@RequestParam(value = "shortname") String shortname,@RequestParam(value = "pageNow") String pageNow, ModelMap map,HttpSession session) {
		Admin admin =(Admin)session.getAttribute("admin");
		if(admin!=null){
			Page page = null;
			int totalcount = service.getCount(codevalue);
			if (pageNow != null) {
				page = new Page(totalcount, Integer.parseInt(pageNow));
			} else {
				page = new Page(totalcount, 1);
			}
			List<ITVVideoMenu> list = service.AllItvVideoMenu(codevalue,page.getStartPos(),page.getPageSize());
			map.addAttribute("menuList", list);
			map.addAttribute("shortName", shortname);
			map.addAttribute("codevalue", codevalue);
			map.addAttribute("page", page);
			return "/itvideomenu";
		}else{
			return "error";
		}
	}

	@RequestMapping("/insert")
	public void insertVideo( @RequestParam(value = "state") int state,@RequestParam(value = "codevalue") String codevalue,
			@RequestParam(value = "title") String title, @RequestParam(value = "filespec") String filespec,
			@RequestParam(value = "starttime") int time, @RequestParam(value = "length") int length,
			@RequestParam(value="index")int mIndex, PrintWriter writer) {
		ITVVideoMenu menu = new ITVVideoMenu();
		Date date = new Date();
		menu.setmCreatetime(date);
		menu.setmState(state);
		menu.setmFileSpec(filespec);
		menu.setmIndex(mIndex);
		menu.setmTitle(title);
		menu.setmLength(length);
		menu.setmStartpos(time);
		menu.setmAreaCode(codevalue);
		int insertFlag = service.AddVideoMenu(menu);
		if (insertFlag > 0) {
			writer.write("添加成功");
		} else {
			writer.write("添加失败");
		}

	}

	@RequestMapping("/update")
	public  void  updateVideo(@RequestParam(value = "id") int mId, @RequestParam(value = "state") int state,
			@RequestParam(value = "title") String title, @RequestParam(value = "filespec") String filespec,
			@RequestParam(value = "starttime") int time, @RequestParam(value = "length") int length,
			@RequestParam(value="index")int mIndex,
			PrintWriter writer) {

		Date date = new Date();
		ITVVideoMenu menu = service.QueryOneVideMenu(mId);
		if(menu!=null){
			menu.setmFileSpec(filespec);
			menu.setmIndex(mIndex);
			menu.setmCreatetime(date);
			menu.setmState(state);
			menu.setmTitle(title);
			menu.setmLength(length);
			menu.setmStartpos(time);
		}else{
			writer.write("不存在相关信息");
			return;
		}
		
		int update = service.UpdateVideoMenu(menu);
		if (update > 0) {
			writer.write("更新成功");
		} else {
			writer.write("更新失败");
		}
	}

	@RequestMapping("/deletes")
	public void deUpdate(@RequestParam(value = "id") int mId, @RequestParam(value = "state") int state,
			PrintWriter writer) {
		int deupdate = service.DeleteVideoMenu(state, mId);
		if (deupdate > 0) {
			if(state==1){
				writer.write("启用成功");
			}else{
				writer.write("禁用成功");
			}
			
		} else {
			if(state==1){
				writer.write("启用失败");
			}else{
				writer.write("禁用失败");
			}
			
		}
	}
}
