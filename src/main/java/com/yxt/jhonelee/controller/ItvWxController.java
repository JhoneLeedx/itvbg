package com.yxt.jhonelee.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.yxt.jhonelee.model.ItvWxpublic;
import com.yxt.jhonelee.service.ItvWxService;
import com.yxt.jhonelee.util.Config;
import com.yxt.jhonelee.util.Page;

@RequestMapping("/itvwx")
@Controller
public class ItvWxController {

	@Autowired
	private ItvWxService service;

	@RequestMapping("/all")
	public String ItvWx(HttpServletRequest request) {

		String pageNow = request.getParameter("pageNow");
		Page page = null;
		int count = service.selectWxCount();
		if (pageNow != null) {
			page = new Page(count, Integer.parseInt(pageNow));
		} else {
			page = new Page(count, 1);
		}
		List<ItvWxpublic> list = service.SelectWx(page.getStartPos(), page.getPageSize());
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		return "itvwx";
	}
	
	@RequestMapping("alllist")
	public void ItvWxall(PrintWriter writer){
		List<ItvWxpublic> list = service.SelectWxall();
			Gson gson = new Gson();
			String json = gson.toJson(list);
			writer.write(json);
	}

	/**
	 * 
	 * @param wxurl
	 * @param request
	 * @param mName
	 * @param state
	 * @param writer
	 */
	@RequestMapping(value = { "/add" }, method = RequestMethod.POST)
	public void Add(@RequestParam(value = "wxurl", required = false) MultipartFile wxurl, HttpServletRequest request,
			@RequestParam(value = "mName") String mName, @RequestParam(value = "state") int state, PrintWriter writer) {
		ItvWxpublic wxpublic = new ItvWxpublic();
		wxpublic.setmName(mName);
		wxpublic.setmState(state);
		Date date = new Date();
		wxpublic.setmCreateTime(date);
		String errorMessage = "";
		if (wxurl == null) {
			errorMessage = "当前没有上传图片";
		} else {
			int wxint = wxurl.getOriginalFilename().lastIndexOf(".");
			String wxtype = wxurl.getOriginalFilename().substring(wxint);
			String savePath = request.getSession().getServletContext().getRealPath("images");
			File wxfile = new File(savePath, "upload/wx");
			if (!wxfile.exists() && !wxfile.isDirectory()) {
				System.out.println(savePath + "目录不存在，需要创建"); // 创建目录
				wxfile.mkdir();
			}
			try {
				String file_ture_name = UUID.randomUUID().toString().replaceAll("\\-", "") + wxtype;
				FileUtils.writeByteArrayToFile(new File(wxfile, file_ture_name), wxurl.getBytes());
				String wxUrl = Config.LOCALURL + ":" + request.getServerPort() + request.getContextPath()
						+ "/images/upload/wx/" + file_ture_name;
				wxpublic.setmWxUrl(wxUrl);
			} catch (IOException e) {
				e.printStackTrace();
				errorMessage = "图片上传失败";
			}
		}
		int addvalue = service.AddWxpublic(wxpublic);
		if (addvalue > 0) {
			errorMessage = "添加成功";
		} else {
			errorMessage = "添加失败";
		}
		writer.write(errorMessage);
	}

	@RequestMapping(value = { "/update" }, method = RequestMethod.POST)
	public void update(@RequestParam(value = "ewxurl", required = false) MultipartFile wxurl,
			HttpServletRequest request, @RequestParam(value = "ename") String mName,
			@RequestParam(value = "estate") int state, @RequestParam(value = "eid") int mId, PrintWriter writer) {
		ItvWxpublic pWxpublic = service.oneWxpublic(mId);
		String errorMessage = "";
		if (pWxpublic != null) {
			if (wxurl == null) {
				errorMessage = "当前没有上传图片";
			} else {
				int wxint = wxurl.getOriginalFilename().lastIndexOf(".");
				String wxtype = wxurl.getOriginalFilename().substring(wxint);
				String savePath = request.getSession().getServletContext().getRealPath("images");
				File wxfile = new File(savePath, "upload/wx");
				if (!wxfile.exists() && !wxfile.isDirectory()) {
					System.out.println(savePath + "目录不存在，需要创建"); // 创建目录
					wxfile.mkdir();
				}
				try {
					String file_ture_name = UUID.randomUUID().toString().replaceAll("\\-", "") + wxtype;
					FileUtils.writeByteArrayToFile(new File(wxfile, file_ture_name), wxurl.getBytes());
					String wxUrl = Config.LOCALURL + ":" + request.getServerPort() + request.getContextPath()
							+ "/images/upload/wx/" + file_ture_name;
					pWxpublic.setmWxUrl(wxUrl);
				} catch (IOException e) {
					e.printStackTrace();
					errorMessage = "图片上传失败";
				}
			}
			pWxpublic.setmName(mName);
			pWxpublic.setmState(state);
			pWxpublic.setmCreateTime(new Date());
			int update = service.updateWx(pWxpublic);
			if (update > 0) {
				errorMessage = "编辑成功";
			} else {
				errorMessage = "编辑失败";
			}
		} else {
			errorMessage = "编辑的对象不存在";
		}
		writer.write(errorMessage);
	}

	@RequestMapping("/del")
	public void del(@RequestParam(value = "id") int mId, @RequestParam(value = "state") int mState,
			PrintWriter writer) {

		int del = service.updateWxState(mId, mState);
		if(del>0){
			writer.write("成功");
		}else {
			writer.write("失败");
		}
	}
	
	@RequestMapping("addwx")
	public String addWx(){
		
		return "addwx";
	}
	@RequestMapping("editwx")
	public String editWx(@RequestParam(value="id")int mId,HttpServletRequest request){
		ItvWxpublic itvwx = service.oneWxpublic(mId);
		request.setAttribute("wx", itvwx);
		return "editwx";
	}
}
