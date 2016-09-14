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

@RequestMapping("/admin")
@Controller
public class ITVAdminController {

	@Autowired
	private AdminService service;

	@RequestMapping(value = { "/login" })
	public void login(PrintWriter writer, HttpSession session, @RequestParam(value = "admin") String admin,
			@RequestParam(value = "pass") String pass) {
		Admin admins = service.LoginAdmin(admin, pass);
		if(admins!=null){
		if(admins.getmType()==2){
			session.setAttribute("admin", admins);
			writer.write("成功");
		}else{
			writer.write("当前管理员不属于家庭医生后台管理，请重新输入");
		}
		}else{
			writer.write("不存在当前用户,可能原因账号或密码错误");
		}
		
	}

	@RequestMapping("/logout")
	public void logout(PrintWriter writer, HttpSession session) {
		session.removeAttribute("admin");
		writer.write("成功");
	}

	@RequestMapping("/adminlist")
	public String Admin(HttpServletRequest request) {
		List<Admin> list = service.AllItvAdmin();
		request.setAttribute("list", list);
		return "/admin";
	}

}
