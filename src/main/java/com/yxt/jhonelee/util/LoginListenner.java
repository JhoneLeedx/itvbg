package com.yxt.jhonelee.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.yxt.jhonelee.model.Admin;

/**
 * @ClassName: LoginListenner
 * @Description: 登录监听类-处理同一时间只允许账号，单地点登录
 * @author JhoneLee
 *
 */

public class LoginListenner implements HttpSessionAttributeListener,HttpSessionListener  {

	private Map<String, HttpSession> map = new HashMap<String, HttpSession>();
	/**
	 * 用户和Session绑定关系 
	 */  
	public static final Map<String, HttpSession> USER_SESSION=new HashMap<String, HttpSession>();  
	  
	/** 
	 * seeionId和用户的绑定关系 
	 */  
	public static final Map<String, String> SESSIONID_USER=new HashMap<String, String>();  
	/**
	 * 当向session中放入数据触发
	 */
	public void attributeAdded(HttpSessionBindingEvent se) {
		// TODO Auto-generated method stub
		String name = se.getName();

		if (name.equals("admin")) {
			Admin admin = (Admin) se.getValue();
			if (map.get(admin.getmAdminName()) != null) {
				HttpSession session = map.get(admin.getmAdminName());
				 session.setAttribute("sms","账号已经登录，你被迫下线");
				session.removeAttribute("admin");
				session.invalidate();
			}
			map.put(admin.getmAdminName(), se.getSession());
		}

	}

	/**
	 * 当向session中移除数据触发
	 */
	public void attributeRemoved(HttpSessionBindingEvent se) {
		// TODO Auto-generated method stub
		String name = se.getName();
		if (name.equals("admin")) {
			Admin admin = (Admin) se.getValue();
			map.remove(admin.getmAdminName());
			System.out.println("账号"+admin.getmAdminName()+"已经退出。");
		}
	}

	public void attributeReplaced(HttpSessionBindingEvent se) {
		// TODO Auto-generated method stub
		   String name = se.getName();
	        if(name.equals("admin")){
	            Admin admin = (Admin)se.getValue();
	            //移除旧的登录信息
	            map.remove(admin.getmAdminName());
	            
	            //新的的登录信息
	            Admin newAdmin = (Admin)se.getSession().getAttribute("admin");
	            
	            //判断是否在别的机器上登录过
	            if(map.get(newAdmin.getmAdminName())!=null){
	                HttpSession session = map.get(newAdmin.getmAdminName());
	                session.removeAttribute("admin");
	                session.setAttribute("sms", "你的账号在别的机器上登录，你被迫下线。");
	            }
	            map.put(newAdmin.getmAdminName(), se.getSession());
	        }
	    }

	public Map<String, HttpSession> getMap() {
		return map;
	}

	public void setMap(Map<String, HttpSession> map) {
		this.map = map;
	}

	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		
	}

	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		
	}

}
