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
import com.yxt.jhonelee.service.AdminService;
import com.yxt.jhonelee.util.Page;

@RequestMapping("/admin")
@Controller
public class ITVAdminController {

	@Autowired
	private AdminService service;

	@RequestMapping(value = { "/login" })
	public void login(PrintWriter writer, HttpSession session, @RequestParam(value = "admin") String admin,
			@RequestParam(value = "pass") String pass) {

		Admin a = (Admin) session.getAttribute("admin");
		if (a != null) {
			writer.write("账号已经登录");
		} else {

			Admin admins = service.LoginAdmin(admin, pass);
			if (admins != null) {
				if (admins.getmType() == 2) {
					session.setAttribute("admin", admins);
					writer.write("成功");
				} else {
					writer.write("当前管理员不属于家庭医生后台管理，请重新输入");
				}
			} else {
				writer.write("不存在当前用户,可能原因账号或密码错误");
			}
		}

	}

	@RequestMapping("/logout")
	public void logout(PrintWriter writer, HttpSession session) {
		if (session != null) {
			session.invalidate(); // 使该Session失效
			writer.write("成功");
		}

	}

	@RequestMapping("/adminlist")
	public String Admin(HttpServletRequest request) {

		String pageNow = request.getParameter("pageNow");
		Page page = null;
		int count = service.getCount();
		if (pageNow != null) {
			page = new Page(count, Integer.parseInt(pageNow));
		} else {
			page = new Page(count, 1);
		}
		List<Admin> list = service.AllItvAdmin(page.getStartPos(), page.getPageSize());
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		return "/admin";
	}

	@RequestMapping("/del")
	public void delAdmin(@RequestParam(value = "id") int mId, PrintWriter writer) {

		int del = service.delAdmin(mId);
		if (del > 0) {
			writer.write("删除成功");
		} else {
			writer.write("删除失败");
		}
	}

	@RequestMapping("/updateAdmin")
	public void update(@RequestParam(value = "id") int mId, @RequestParam(value = "name") String mName,
			@RequestParam(value = "pass") String mPass, @RequestParam(value = "level") int mLevel,
			@RequestParam(value = "type") int mType, PrintWriter writer) {
		Admin admin = new Admin();
		admin.setmId(mId);
		admin.setmAdminName(mName);
		admin.setmAdminPass(mPass);
		admin.setmLevel(mLevel);
		admin.setmType(mType);

		int up = service.updateAdmin(admin);
		if (up > 0) {
			writer.write("编辑成功");
		} else {
			writer.write("编辑失败");
		}
	}

	@RequestMapping("/addAdmin")
	public void add(PrintWriter writer, @RequestParam(value = "name") String mName,
			@RequestParam(value = "pass") String mPass, @RequestParam(value = "level") int mLevel,
			@RequestParam(value = "type") int mType) {

		Admin admin = new Admin();
		admin.setmAdminName(mName);
		admin.setmAdminPass(mPass);
		admin.setmLevel(mLevel);
		admin.setmType(mType);
		int add = service.AddAdmin(admin);
		if (add > 0) {
			writer.write("添加成功");
		} else {
			writer.write("添加失败");
		}

	}

}
