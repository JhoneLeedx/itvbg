package com.yxt.jhonelee.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.jdbc.StringUtils;
import com.yxt.jhonelee.model.Admin;
import com.yxt.jhonelee.service.AdminService;
import com.yxt.jhonelee.util.CreateImageCode;
import com.yxt.jhonelee.util.Md5Util;
import com.yxt.jhonelee.util.Page;

/**
 * @time 2016年9月22日10:53:33
 * @author JhoneLee
 *
 */
@RequestMapping("/admin")
@Controller
public class ITVAdminController {

	@Autowired
	private AdminService service;

	/**
	 * 
	 * @param writer
	 * @param session
	 * @param admin
	 * @param pass
	 *            登录验证
	 */
	@RequestMapping(value = { "/login" })
	public void login(PrintWriter writer, HttpSession session, @RequestParam(value = "admin") String admin,
			@RequestParam(value = "pass") String pass, HttpServletRequest request, HttpServletResponse response) {

		String mpass = Md5Util.EncoderByMd5(pass);
		Admin admins = service.LoginAdmin(admin, mpass);
		if (admins != null) {
			if (admins.getmType() == 2) {
				session.setAttribute("admin", admins);
				writer.write("成功");
				addCookie(admin, pass, response, request);
			} else {
				writer.write("当前管理员不属于家庭医生后台管理，请重新输入");
			}
		} else {
			writer.write("不存在当前用户,可能原因账号或密码错误");
		}
		// writer.println(new Gson().toJson(admins));
	}

	/**
	 * 
	 * @param writer
	 * @param session
	 *            退出验证
	 */
	@RequestMapping("/logout")
	public void logout(PrintWriter writer, HttpSession session) {
		session.invalidate(); // 使该Session失效
		writer.write("成功");
	}

	/**
	 * 
	 * @param request
	 * @return 返回到数据页面
	 */
	@RequestMapping("/adminlist")
	public String AdminList(HttpServletRequest request, HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin != null) {
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
		} else {
			return "error";
		}

	}

	/**
	 * 
	 * @param mId
	 * @param writer
	 *            删除操作
	 */
	@RequestMapping("/del")
	public void delAdmin(@RequestParam(value = "id") int mId, PrintWriter writer) {

		int del = service.delAdmin(mId);
		if (del > 0) {
			writer.write("删除成功");
		} else {
			writer.write("删除失败");
		}
	}

	/**
	 * 
	 * @param mId
	 * @param mName
	 * @param mPass
	 * @param mLevel
	 * @param mType
	 * @param writer
	 *            更新操作
	 */
	@RequestMapping("/updateAdmin")
	public void update(@RequestParam(value = "id") int mId, @RequestParam(value = "name") String mName,
			@RequestParam(value = "pass") String mPass, @RequestParam(value = "type") int mType,
			@RequestParam(value = "town") String towm, PrintWriter writer) {
		Admin admin = service.OneAdmin(mId);
		admin.setmId(mId);
		admin.setmAdminName(mName);
		String pass = Md5Util.EncoderByMd5(mPass);
		admin.setmAdminPass(pass);
		admin.setmType(mType);
		admin.setmPid(towm);
		int up = service.updateAdmin(admin);
		if (up > 0) {
			writer.write("编辑成功");
		} else {
			writer.write("编辑失败");
		}
	}

	/**
	 * 
	 * @param writer
	 * @param mName
	 * @param mPass
	 * @param mLevel
	 * @param mType
	 *            添加操作
	 */
	@RequestMapping("/addAdmin")
	public void add(PrintWriter writer, @RequestParam(value = "name") String mName,
			@RequestParam(value = "pass") String mPass, @RequestParam(value = "level") int mLevel,
			@RequestParam(value = "type") int mType, @RequestParam(value = "town") String towm) {

		Admin admin = new Admin();
		admin.setmAdminName(mName);
		String pass = Md5Util.EncoderByMd5(mPass);
		admin.setmAdminPass(pass);
		admin.setmLevel(mLevel);
		admin.setmType(mType);
		if (!towm.equals("请选择")) {
			admin.setmPid(towm);
		}
		int add = service.AddAdmin(admin);
		if (add > 0) {
			writer.write("添加成功");
		} else {
			writer.write("添加失败");
		}

	}

	/**
	 * 验证码
	 */
	@RequestMapping("/captcha")
	@ResponseBody
	public void captcha(HttpServletRequest request, HttpServletResponse response) throws ServletException {

		try {
			CreateImageCode.getCode3(request, response);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 验证验证码是否正确
	 * 
	 * @param session
	 */
	@RequestMapping("/checkCode")
	public void checkCode(HttpSession session, @RequestParam(value = "code") String code, PrintWriter writer) {
		String rightCode = (String) session.getAttribute("code");

		if (code.equalsIgnoreCase(rightCode)) {
			writer.write("right");
		} else {
			writer.write("wrong");
		}
	}

	@RequestMapping("showAddAdmin")
	public String addAdmin() {

		return "addadmin";
	}

	@RequestMapping("showEditAdmin")
	public String editAdimn(@RequestParam(value = "id") int mId, HttpServletRequest request) {
		Admin admin = service.OneAdmin(mId);
		request.setAttribute("admins", admin);
		return "editadmin";
	}

	/** Cookie的实现 **/
	private void addCookie(String name, String password, HttpServletResponse response, HttpServletRequest request) {
		if (StringUtils.isNullOrEmpty(name) && StringUtils.isNullOrEmpty(password)) {
			// 创建Cookie
			Cookie nameCookie;
			nameCookie = new Cookie("name", name);
			Cookie pswCookie = new Cookie("psw", password);
			// 设置Cookie的父路径
			nameCookie.setPath(request.getContextPath() + "/");
			pswCookie.setPath(request.getContextPath() + "/");
			// 获取是否保存Cookie
			String rememberMe = request.getParameter("rememberMe");
			if (rememberMe == null) {// 不保存Cookie
				nameCookie.setMaxAge(0);
				pswCookie.setMaxAge(0);
			} else {// 保存Cookie的时间长度，单位为秒
				nameCookie.setMaxAge(7 * 24 * 60 * 60);
				pswCookie.setMaxAge(7 * 24 * 60 * 60);
			}
			// 加入Cookie到响应头
			response.addCookie(nameCookie);
			response.addCookie(pswCookie);
		}
	}
}
