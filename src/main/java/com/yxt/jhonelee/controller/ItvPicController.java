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
import com.yxt.jhonelee.util.Page;

@RequestMapping("/itvpic")
@Controller
public class ItvPicController {

	@Autowired
	private ItvPicService service;

	@RequestMapping("/itvpiclist")
	public String ItvPicList(HttpServletRequest request) {

		
		
		String pageNow = request.getParameter("pageNow");
		Page page1 = null;
		Page page2 = null;
		Page page3 = null;
		Page page4 = null;
		int count1 = service.ItvPicListCount(1);
		int count2 = service.ItvPicListCount(2);
		int count3 = service.ItvPicListCount(3);
		int count4 = service.ItvPicListCount(10000);
		if (pageNow != null) {
			page1 = new Page(count1, Integer.parseInt(pageNow));
			page2 = new Page(count2, Integer.parseInt(pageNow));
			page3 = new Page(count3, Integer.parseInt(pageNow));
			page4 = new Page(count4, Integer.parseInt(pageNow));
		} else {
			page1 = new Page(count1, 1);
			page2 = new Page(count2, 1);
			page3 = new Page(count3, 1);
			page4 = new Page(count4, 1);
		}

		List<ItvPicture> list1 = service.ItvPicList(1,page1.getStartPos(),page1.getPageSize());
		List<ItvPicture> list2 = service.ItvPicList(2,page2.getStartPos(),page2.getPageSize());
		List<ItvPicture> list3 = service.ItvPicList(3,page3.getStartPos(),page3.getPageSize());
		List<ItvPicture> list4 = service.ItvPicList(10000,page4.getStartPos(),page4.getPageSize());
		
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("list4", list4);
        request.setAttribute("page1", page1);
        request.setAttribute("page2", page2);
        request.setAttribute("page3", page3);
        request.setAttribute("page4", page4);
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
	@RequestMapping("editpic")
	public String editPic(HttpServletRequest request,@RequestParam(value="id")int mId){
		ItvPicture picture = service.OneItvPic(mId);
		request.setAttribute("itvpic", picture);
		return "editpic";
	}
}
