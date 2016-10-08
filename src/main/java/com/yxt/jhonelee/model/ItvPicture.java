package com.yxt.jhonelee.model;

import java.io.Serializable;

public class ItvPicture implements Serializable{

	
	/**
	 * itv医院图片存储
	 */
	private static final long serialVersionUID = -1386434139157276255L;
	private int mId;
	private String mName;
	private String mAddressName;
	private String mTelphone;
	private int mState;
	private int mType;
	private String mItvpic;
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
	public String getmAddressName() {
		return mAddressName;
	}
	public void setmAddressName(String mAddressName) {
		this.mAddressName = mAddressName;
	}
	public String getmTelphone() {
		return mTelphone;
	}
	public void setmTelphone(String mTelphone) {
		this.mTelphone = mTelphone;
	}
	public int getmState() {
		return mState;
	}
	public void setmState(int mState) {
		this.mState = mState;
	}
	public int getmType() {
		return mType;
	}
	public void setmType(int mType) {
		this.mType = mType;
	}
	public String getmItvpic() {
		return mItvpic;
	}
	public void setmItvpic(String mItvpic) {
		this.mItvpic = mItvpic;
	}
	
}
