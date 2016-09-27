package com.yxt.jhonelee.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yxt.jhonelee.model.Admin;
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

	/**
	 * 
	 * @param request
	 * @return 分页查询显示所有数据
	 */
	@RequestMapping("/all")
	public String allStb(HttpServletRequest request,HttpSession session) {
		Admin admin =(Admin)session.getAttribute("admin");
		if(admin!=null){
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
		}else{
			return "error";
		}
	}
    /**
     * 
     * @param id
     * @param writer 删除操作
     */
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

	/**
	 * 
	 * @param writer
	 * @param id
	 * @param brand
	 * @param model
	 * @param type
	 * @param isIptv
	 * @param iscall  更新操作
	 */
	@RequestMapping("updateStb")
	public void update(PrintWriter writer, @RequestParam(value = "id") int id,
			@RequestParam(value = "brand") String brand, @RequestParam(value = "model") String model,
			@RequestParam(value = "type") String type, @RequestParam(value = "isIptv") int isIptv,
			@RequestParam(value = "iscall") int iscall,@RequestParam(value = "iptvid") String iptvid,
			@RequestParam(value = "iptvtoken") String iptvtoken,@RequestParam(value = "remark") String remark) {
		String result = null;
		ItvSTB itv = service.selectOneStb(id);
		if (itv != null) {
			itv.setmBrand(brand);
			itv.setmModel(model);
			itv.setmType(type);
			itv.setmIsIptv(isIptv);
			itv.setmIsMediaCall(iscall);
			itv.setmIptvId(iptvid);
			itv.setmIptvToken(iptvtoken);
			itv.setmRemark(remark);
			int update = service.updateSTB(itv);
			if (update > 0) {

				result = "编辑成功";
			} else {
				result = "编辑失败";
			}
		} else {
			result = "当前不存在这个记录";
		}
		writer.write(result);
	}

	/**
	 * 
	 * @param request
	 * @return 返回模糊查询的结果集
	 */
	@RequestMapping("/vague")
	public String vagueSelect(HttpServletRequest request) {
		String pageNow = request.getParameter("pageNow");
		String mCode = request.getParameter("search");
		if(mCode==""){
			
			request.getSession().setAttribute("error", "搜索为空");
			return "redirect:/itvstb/all";
		}
		int count = service.vagueGetCount(mCode);
		Page page = null;
		if (pageNow != null) {
			page = new Page(count, Integer.parseInt(pageNow));
		} else {
			page = new Page(count, 1);
		}
		List<ItvSTB> list = service.vagueSelect(page.getStartPos(), page.getPageSize(), mCode);
		if (list.size() > 0) {
			request.setAttribute("code", mCode);
			request.setAttribute("list", list);
			request.setAttribute("page", page);
			request.getSession().setAttribute("error", "搜索成功");
			return "stbSearch";
		} else {
			request.getSession().setAttribute("error", "搜索的结果不存在");
			return "redirect:/itvstb/all";
		}
	}
}
