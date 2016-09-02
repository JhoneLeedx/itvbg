package com.yxt.jhonelee.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.yxt.jhonelee.model.ITVAddress;
import com.yxt.jhonelee.service.ITVAddressService;

@RequestMapping("/address")
@Controller
public class ITVAddressController {

	@Autowired
	private ITVAddressService service;

	@RequestMapping("/showAddress")
	public String getAddress(HttpServletRequest request) {

		List<ITVAddress> list = service.AllITVAddress();
		request.setAttribute("list", list);
		return "/main";
	}

	@RequestMapping(value={"/upload"},method=RequestMethod.POST)
	public String uploadImage(@RequestParam(value = "logo", required = false) MultipartFile logo,HttpServletRequest request,ModelMap map) {
		
		
		ITVAddress address = new ITVAddress();
		int up = service.UpdateItvAddress(address);
		if(up>0){
			return "/result";
		}else{
			return "/error";
		}
		
		
	/*	String logoname = logo.getOriginalFilename();
		
		if(logoname.equals("")){
			return "/";
		}else{
			// process the uploaded file
			String savePath = request.getSession().getServletContext().getRealPath("images");
			File logofile = new File(savePath,"upload/logo");
			if (!logofile.exists() && !logofile.isDirectory()) {
				System.out.println(savePath + "目录不存在，需要创建");
				// 创建目录
				logofile.mkdir();
			}
				 try {
					FileUtils.writeByteArrayToFile(new File(logofile,logoname), logo.getBytes());
					String logourl =request.getContextPath()+"/images/upload/logo/" + logoname;
					map.addAttribute("logourl", logourl);
				} catch (IOException e) {
					e.printStackTrace();
					return "图片上传失败";
				}
			return "/result";
		}*/
	}
}
