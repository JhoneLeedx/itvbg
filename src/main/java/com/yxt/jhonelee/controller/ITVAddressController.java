package com.yxt.jhonelee.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.yxt.jhonelee.model.Admin;
import com.yxt.jhonelee.model.ITVAddress;
import com.yxt.jhonelee.service.ITVAddressService;
import com.yxt.jhonelee.util.Config;
import com.yxt.jhonelee.util.Page;
/**
 * 
 * @author JhoneLee
 *   地区管理控制器
 */
@RequestMapping("/address")
@Controller
public class ITVAddressController {

	@Autowired
	private ITVAddressService service;

	@RequestMapping("/showAddress")
	public String getAddress(HttpServletRequest request,HttpSession session) {

		Admin admin =(Admin)session.getAttribute("admin");
		if(admin!=null){
			Page page = null;
			String pageNow = request.getParameter("pageNow");
			int totalcount = service.getCount();
			if (pageNow != null) {
				page = new Page(totalcount, Integer.parseInt(pageNow));
			} else {
				page = new Page(totalcount, 1);
			}
			List<ITVAddress> list = service.AllITVAddress(page.getStartPos(),page.getPageSize());
			request.setAttribute("list", list);
			request.setAttribute("page", page);
			return "/main";
		}else{
			return "error";
		}
	}

	@RequestMapping(value = { "/upload" }, method = RequestMethod.POST)
	public void uploadImage(@RequestParam(value = "logo", required = false) MultipartFile logo,
			HttpServletRequest request, @RequestParam(value = "areaCode") String areaCode,
			@RequestParam(value = "shortName") String shortName,
			@RequestParam(value = "addressCodeValue") String addressCodeValue,
			@RequestParam(value = "wxCode") String urlwxCode, @RequestParam(value = "flag") int flag,
			PrintWriter writer) {

		String errorMessage = "";

		ITVAddress address = service.SecOneItvAddress(areaCode);
		address.setmShortName(shortName);
		if(urlwxCode.equals("请选择")){
		}else{
			address.setmWXQrcodeImageURL(urlwxCode);
		}
		String[] a = addressCodeValue.split("@");
		if (a.length >= 2) {
			address.setmAddressId(Integer.parseInt(a[0]));
			address.setmAddressCode(a[1]);
		}
		address.setmState(flag);
		if (logo == null) {
			errorMessage = "当前没有上传图片";
		} else {
			String logoname = logo.getOriginalFilename();
			String savePath = request.getSession().getServletContext().getRealPath("images");
			File logofile = new File(savePath, "upload/logo");
			if (!logofile.exists() && !logofile.isDirectory()) {
				System.out.println(savePath + "目录不存在，需要创建"); // 创建目录
				logofile.mkdir();
			}
			try {

				FileUtils.writeByteArrayToFile(new File(logofile, logoname), logo.getBytes());
		/*		String logourl = Config.CLOUDURL + ":" + request.getServerPort() + request.getContextPath()
						+ "/images/upload/logo/" + logoname;*/
				String logourl = Config.CLOUDURL + ":" + request.getServerPort() + request.getContextPath()
				+ "/images/upload/logo/" + logoname;
				address.setmLogoIMageURL(logourl);

			} catch (IOException e) {
				e.printStackTrace();
				errorMessage = "图片上传失败";
			}
		}
		int up = service.UpdateItvAddress(address);
		if (up > 0) {
			errorMessage = "编辑成功";
		} else {
			errorMessage = "编辑失败,请联系管理员";
		}
		writer.write(errorMessage);
	}

	@RequestMapping("/home")
	public String showHome() {
		return "home";
	}
	@RequestMapping("/del")
	public void del(PrintWriter writer,@RequestParam(value="areacode")String areacode,
			@RequestParam(value="state")int state){
		int del = service.delAddress(areacode, state);
		if(del>0){
			if(state==1){
				writer.write("启用成功");	
			}else{
				writer.write("禁用成功");	
			}
		}else{
			if(state==1){
				writer.write("启用失败");	
			}else{
				writer.write("禁用失败");	
			}
		}
	}
}
