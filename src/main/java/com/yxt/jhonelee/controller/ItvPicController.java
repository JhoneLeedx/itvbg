package com.yxt.jhonelee.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
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

	@RequestMapping(value= {"/itvpicUpload"}, method = RequestMethod.POST)
	public void itvpicUpdate(@RequestParam(value = "itvpic", required = false) MultipartFile itvpic,
			@RequestParam(value = "id") int mId,@RequestParam(value = "type") int type, PrintWriter writer) {
		String savepath= "";
		String errorMessage = "";
		if(type==1){
			savepath = Config.GUIDEHOSPITALPIC;
		}else if(type==2){
			savepath = Config.BASICHOSPITALPIC;
		}else if(type==3){
			savepath = Config.YAODIANPIC;
		}else{
			savepath = Config.LEADHOSPITALPIC;
		}
		int  picint = itvpic.getOriginalFilename().lastIndexOf(".");
		String pictype = itvpic.getOriginalFilename().substring(picint);
		File file = new File(savepath);
		if(!file.exists()&&!file.isDirectory()){
			System.out.println(savepath + "目录不存在，需要创建"); // 创建目录
			file.mkdir();
		}
		 String file_ture_name = UUID.randomUUID().toString().replaceAll("\\-", "")+pictype;
		 try {
			FileUtils.writeByteArrayToFile(new File(file, file_ture_name), itvpic.getBytes());
			errorMessage = "图片上传成功";
			
			ItvPicture itvPicture  = new ItvPicture();
			itvPicture.setmId(mId);
			itvPicture.setmItvpic(file_ture_name);
			int update = service.UpdateItvPic(itvPicture);
			if(update>0){
				errorMessage = "图片上传成功，修改成功";
			}else{
				errorMessage = "图片上传成功，修改失败";
			}
			
		} catch (IOException e) {
			e.printStackTrace();
			errorMessage = "图片上传失败";
		}
		 writer.write(errorMessage);
	}

	@RequestMapping("/showImage")
	public void showImage(HttpServletResponse response,@RequestParam(value = "type") int type,@RequestParam(value = "itvpic") String itvpic){
		String savepath= "";
		if(type==1){
			savepath = Config.GUIDEHOSPITALPIC;
		}else if(type==2){
			savepath = Config.BASICHOSPITALPIC;
		}else if(type==3){
			savepath = Config.YAODIANPIC;
		}else{
			savepath = Config.LEADHOSPITALPIC;
		}
		File file = new File(savepath,itvpic);
		if(file.isFile()){
			try {
				FileInputStream fis = new FileInputStream(file);
				OutputStream os = response.getOutputStream();
				int l = 0; 
				byte[] buffer = new byte[4096]; 
				while((l = fis.read(buffer)) != -1){ 
					os.write(buffer,0,l); 
				} 
				os.flush(); 
				fis.close(); 
				os.close(); 
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
