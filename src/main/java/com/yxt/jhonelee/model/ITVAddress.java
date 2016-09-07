package com.yxt.jhonelee.model;

import java.util.Date;
/**
 * 
 * @author JhoneLee
 * itv所在的地区
 */
public class ITVAddress {

	private int mId;//主键id
	private String mAreaCode; //地区编码
	private String mAreaName;//地区全称
	private String mShortName;//地区简称
	private String mAddressId;//地区id
	private String mAddressCode;//地区code
	private String mWXQrcodeImageURL;//相关地区微信二维码图片的url地址
	private String mLogoIMageURL;//当前地区logo图片的url地址
	private int mIsFull;//信息是否完整
	private int mState;//状态字段：0-禁用 1-正常
	private Date mCreateTime;//创建时间
	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
	}
	public String getmAreaCode() {
		return mAreaCode;
	}
	public void setmAreaCode(String mAreaCode) {
		this.mAreaCode = mAreaCode;
	}
	public String getmAreaName() {
		return mAreaName;
	}
	public void setmAreaName(String mAreaName) {
		this.mAreaName = mAreaName;
	}
	public String getmShortName() {
		return mShortName;
	}
	public void setmShortName(String mShortName) {
		this.mShortName = mShortName;
	}
	public String getmAddressId() {
		return mAddressId;
	}
	public void setmAddressId(String mAddressId) {
		this.mAddressId = mAddressId;
	}
	public String getmAddressCode() {
		return mAddressCode;
	}
	public void setmAddressCode(String mAddressCode) {
		this.mAddressCode = mAddressCode;
	}
	public String getmWXQrcodeImageURL() {
		return mWXQrcodeImageURL;
	}
	public void setmWXQrcodeImageURL(String mWXQrcodeImageURL) {
		this.mWXQrcodeImageURL = mWXQrcodeImageURL;
	}
	public String getmLogoIMageURL() {
		return mLogoIMageURL;
	}
	public void setmLogoIMageURL(String mLogoIMageURL) {
		this.mLogoIMageURL = mLogoIMageURL;
	}
	public int getmIsFull() {
		return mIsFull;
	}
	public void setmIsFull(int mIsFull) {
		this.mIsFull = mIsFull;
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
