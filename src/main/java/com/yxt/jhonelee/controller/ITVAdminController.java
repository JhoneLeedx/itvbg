package com.yxt.jhonelee.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class ITVAdminController {

	@RequestMapping("/login")
	public void login(PrintWriter writer,HttpSession session){
		session.setAttribute("admin", "admin");
		writer.write("成功");
	}
	@RequestMapping("/logout")
	public void logout(PrintWriter writer,HttpSession session){
		session.removeAttribute("admin");
		writer.write("成功");
	}

	@RequestMapping("/adminlist")
	public String Admin(){
		
		
		
		return "/admin";
	}
	
}
