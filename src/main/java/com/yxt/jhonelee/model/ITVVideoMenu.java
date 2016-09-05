package com.yxt.jhonelee.model;

import java.util.Date;

public class ITVVideoMenu {

	
	private int mId;//视频主键id
	private int mIndex;//排序id
	private String mAreaCode;//地区标识编码id
	private String mTitle;//视频信息的名称
	private String mFileSpec;//视频文件的url或id
	private int mStartpos;//视频文件播放的起始地址
	private int mLength;//视频文件的长度
	private int mState;//视频状态值1：正常，0：禁用
	private Date mCreatetime;
	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
	}
	public int getmIndex() {
		return mIndex;
	}
	public void setmIndex(int mIndex) {
		this.mIndex = mIndex;
	}
	public String getmAreaCode() {
		return mAreaCode;
	}
	public void setmAreaCode(String mAreaCode) {
		this.mAreaCode = mAreaCode;
	}
	public String getmTitle() {
		return mTitle;
	}
	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}
	public String getmFileSpec() {
		return mFileSpec;
	}
	public void setmFileSpec(String mFileSpec) {
		this.mFileSpec = mFileSpec;
	}
	public int getmStartpos() {
		return mStartpos;
	}
	public void setmStartpos(int mStartpos) {
		this.mStartpos = mStartpos;
	}
	public int getmLength() {
		return mLength;
	}
	public void setmLength(int mLength) {
		this.mLength = mLength;
	}
	public int getmState() {
		return mState;
	}
	public void setmState(int mState) {
		this.mState = mState;
	}
	public Date getmCreatetime() {
		return mCreatetime;
	}
	public void setmCreatetime(Date mCreatetime) {
		this.mCreatetime = mCreatetime;
	}
	
}
