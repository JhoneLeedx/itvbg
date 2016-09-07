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
import com.yxt.jhonelee.util.Config;

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

	@RequestMapping(value = { "/upload" }, method = RequestMethod.POST)
	public String uploadImage(@RequestParam(value = "logo", required = false) MultipartFile logo,
			HttpServletRequest request, ModelMap map, @RequestParam(value = "areaCode") String areaCode,
			@RequestParam(value = "shortName") String shortName,
			@RequestParam(value = "addressCodeValue") String addressCodeValue,
			@RequestParam(value = "wxCode") String urlwxCode,
			@RequestParam(value="flag")int flag) {

		
		ITVAddress address = new ITVAddress();
		address.setmAreaCode(areaCode);
		address.setmShortName(shortName);
		address.setmWXQrcodeImageURL(urlwxCode);
		String[]a = addressCodeValue.split("@");
		address.setmAddressId(a[0]);
		address.setmAddressCode(a[1]);
		address.setmState(flag);

		String logoname = logo.getOriginalFilename();

		if (logoname.equals("")) {
			return "redirect:/main";
		} else { // process the uploaded

			String savePath = request.getSession().getServletContext().getRealPath("images");
			File logofile = new File(savePath, "upload/logo");
			if (!logofile.exists() && !logofile.isDirectory()) {
				System.out.println(savePath + "目录不存在，需要创建"); // 创建目录
				logofile.mkdir();
			}
			try {

				FileUtils.writeByteArrayToFile(new File(logofile, logoname), logo.getBytes());
				String logourl = Config.url+":"+request.getServerPort()+request.getContextPath() + "/images/upload/logo/" + logoname;
				address.setmLogoIMageURL(logourl);

			} catch (IOException e) {
				e.printStackTrace();
				return "图片上传失败";
			}
			int up = service.UpdateItvAddress(address);
			if (up > 0) {

				return "redirect:/main";
			} else {

				return "/error";
			}
		}
	}
	@RequestMapping("/home")
	public String showHome(){
		
		return "home";
		
	}
}
