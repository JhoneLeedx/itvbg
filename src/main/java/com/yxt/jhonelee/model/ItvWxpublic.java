package com.yxt.jhonelee.model;

import java.io.Serializable;
import java.util.Date;

public class ItvWxpublic implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4602254445344636865L;
	private int mId;
	private String mName;
	private String mWxUrl;
	private int mState;
	private Date mCreateTime;
	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmWxUrl() {
		return mWxUrl;
	}
	public void setmWxUrl(String mWxUrl) {
		this.mWxUrl = mWxUrl;
	}
	public int getmState() {
		return mState;
	}
	public void setmState(int mState) {
		this.mState = mState;
	}
	public Date getmCreateTime() {
		return mCreateTime;
	}
	public void setmCreateTime(Date mCreateTime) {
		this.mCreateTime = mCreateTime;
	}
}
