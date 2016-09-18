package com.yxt.jhonelee.model;

import java.io.Serializable;

/**
 * 
 * @author JhoneLee
 * @category 管理员类
 */
public class Admin implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private int mId;
	private String mAdminName;
	private String mAdminPass;
	private int mLevel;
	private String mPid;
	private int mType;
	
	
	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
	}
	public String getmAdminName() {
		return mAdminName;
	}
	public void setmAdminName(String mAdminName) {
		this.mAdminName = mAdminName;
	}
	public String getmAdminPass() {
		return mAdminPass;
	}
	public void setmAdminPass(String mAdminPass) {
		this.mAdminPass = mAdminPass;
	}
	public int getmLevel() {
		return mLevel;
	}
	public void setmLevel(int mLevel) {
		this.mLevel = mLevel;
	}
	public String getmPid() {
		return mPid;
	}
	public void setmPid(String mPid) {
		this.mPid = mPid;
	}
	public int getmType() {
		return mType;
	}
	public void setmType(int mType) {
		this.mType = mType;
	}


}
