package com.yxt.jhonelee.model;

import java.io.Serializable;

public class ItvSTB implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int mId;
	private String mBrand;
	private String mModel;
	private String mType;
	private String mSysInfoCode;
	private String mSysInfo;
	private int mIsIptv;
	private int mIsMediaCall;
	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
	}
	public String getmBrand() {
		return mBrand;
	}
	public void setmBrand(String mBrand) {
		this.mBrand = mBrand;
	}
	public String getmModel() {
		return mModel;
	}
	public void setmModel(String mModel) {
		this.mModel = mModel;
	}
	public String getmType() {
		return mType;
	}
	public void setmType(String mType) {
		this.mType = mType;
	}
	public String getmSysInfoCode() {
		return mSysInfoCode;
	}
	public void setmSysInfoCode(String mSysInfoCode) {
		this.mSysInfoCode = mSysInfoCode;
	}
	public String getmSysInfo() {
		return mSysInfo;
	}
	public void setmSysInfo(String mSysInfo) {
		this.mSysInfo = mSysInfo;
	}
	public int getmIsIptv() {
		return mIsIptv;
	}
	public void setmIsIptv(int mIsIptv) {
		this.mIsIptv = mIsIptv;
	}
	public int getmIsMediaCall() {
		return mIsMediaCall;
	}
	public void setmIsMediaCall(int mIsMediaCall) {
		this.mIsMediaCall = mIsMediaCall;
	}
}
