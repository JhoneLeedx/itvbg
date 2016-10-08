package com.yxt.jhonelee.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.yxt.jhonelee.model.ItvPicture;
import com.yxt.jhonelee.service.ItvPicService;
import com.yxt.jhonelee.util.Config;

@RequestMapping("/itvpic")
@Controller
public class ItvPicController {

	@Autowired
	private ItvPicService service;

	@RequestMapping("/itvpiclist")
	public String ItvPicList(HttpServletRequest request) {

		List<ItvPicture> list = service.ItvPicList();
		request.setAttribute("list", list);
		return "itvpic";
	}

	@RequestMapping(value = { "/itvpicUpload" }, method = RequestMethod.POST)
	public void itvpicUpdate(@RequestParam(value = "itvpic", required = false) MultipartFile itvpic,
			@RequestParam(value = "id") int mId,@RequestParam(value = "type") int type, PrintWriter writer) {
		String savepath= null;
		if(type==1){
			savepath = Config.GUIDEHOSPITALPIC;
		}else if(type==2){
			savepath = Config.BASICHOSPITALPIC;
		}else if(type==3){
			savepath = Config.YAODIANPIC;
		}else{
			savepath = Config.LEADHOSPITALPIC;
		}
		
		File file = new File(savepath);
		if(!file.exists()&&!file.isDirectory())
		 String file_ture_name = UUID.randomUUID().toString();
           
	}

}
