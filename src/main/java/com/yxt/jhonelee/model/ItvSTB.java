package com.yxt.jhonelee.model;

import java.io.Serializable;

public class ItvSTB implements Serializable{
	
	/**
	 * 机顶盒
	 */
	private static final long serialVersionUID = 1L;
	private int mId;//主键id
	private String mBrand;//品牌
	private String mModel;//型号
	private String mType;//类型（2k,4k,未知）
	
	private String mIptvId;//机顶盒对应IPTV账号
	private String mIptvToken;//想家账号号码
	private String mRemark;//备注（是不是公司内部机顶盒？）
	
	private String mSysInfoCode;//系统信息code值
	private String mSysInfo;//系统信息描述
	private int mIsIptv;//是否支持iptv
	private int mIsMediaCall;//是否支持想家账号
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
	public String getmIptvId() {
		return mIptvId;
	}
	public void setmIptvId(String mIptvId) {
		this.mIptvId = mIptvId;
	}
	public String getmIptvToken() {
		return mIptvToken;
	}
	public void setmIptvToken(String mIptvToken) {
		this.mIptvToken = mIptvToken;
	}
	public String getmRemark() {
		return mRemark;
	}
	public void setmRemark(String mRemark) {
		this.mRemark = mRemark;
	}
}
