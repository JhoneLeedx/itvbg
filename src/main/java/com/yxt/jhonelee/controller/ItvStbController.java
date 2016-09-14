package com.yxt.jhonelee.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yxt.jhonelee.model.ItvSTB;
import com.yxt.jhonelee.service.ItvStbService;
import com.yxt.jhonelee.util.Page;

/**
 * 
 * @author JhoneLee 机顶盒管理控制器
 */

@RequestMapping("/itvstb")
@Controller
public class ItvStbController {

	@Autowired
	private ItvStbService service;

	@RequestMapping("/all")
	public String allStb(HttpServletRequest request) {
		String pageNow = request.getParameter("pageNow");
		Page page = null;
		int count = service.getCount();
		if (pageNow != null) {
			page = new Page(count, Integer.parseInt(pageNow));
		} else {
			page = new Page(count, 1);
		}
		List<ItvSTB> list = service.AllItvStb(page.getStartPos(), page.getPageSize());
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		return "settopbox";
	}

	@RequestMapping("delStb")
	public void delete(@RequestParam(value = "id") int id, PrintWriter writer) {

		int del = service.deleteSTB(id);
		String result = null;
		if (del > 0) {
			result = "删除成功";
		} else {
			result = "删除失败";
		}
		writer.write(result);
	}

	@RequestMapping("updateStb")
	public void update(PrintWriter writer, @RequestParam(value = "id") int id,
			@RequestParam(value = "brand") String brand, @RequestParam(value = "model") String model,
			@RequestParam(value = "type") String type, @RequestParam(value = "isIptv") int isIptv,
			@RequestParam(value = "iscall") int iscall) {
		
		ItvSTB itv = new ItvSTB();
		itv.setmId(id);
		itv.setmBrand(brand);
		itv.setmModel(model);
		itv.setmType(type);
		itv.setmIsIptv(isIptv);
		itv.setmIsMediaCall(iscall);
		int update = service.updateSTB(itv);
		String result = null;
		if(update>0){
			
			result = "编辑成功";
		} else {
			result = "编辑失败";
		}
		writer.write(result);
		

	}

}
