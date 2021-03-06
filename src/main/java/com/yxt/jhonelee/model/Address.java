package com.yxt.jhonelee.model;

import java.io.Serializable;

public class Address implements Serializable{

	private static final long serialVersionUID = 1L;
	private int mId;
	private String mCodeValue;
	private String mName;
	private String mPid;

	public int getmId() {
		return mId;
	}

	public void setmId(int mId) {
		this.mId = mId;
	}

	public String getmCodeValue() {
		return mCodeValue;
	}

	public void setmCodeValue(String mCodeValue) {
		this.mCodeValue = mCodeValue;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmPid() {
		return mPid;
	}

	public void setmPid(String mPid) {
		this.mPid = mPid;
	}
}
