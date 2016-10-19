package com.yxt.jhonelee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yxt.jhonelee.model.ItvWxpublic;

public interface ItvWxpublicDao {

	public List<ItvWxpublic> SelectWx(@Param(value = "startPos") int startPos, @Param(value = "pageSize") int pageSize);

	public List<ItvWxpublic> SelectWxall();

	public int selectWxCount();

	public int AddWxpublic(ItvWxpublic itvWxpublic);

	public ItvWxpublic oneWxpublic(int mId);

	public int updateWx(ItvWxpublic itvWxpublic);

	public int updateWxState(@Param(value = "mId") int mId, @Param(value = "mState") int mState);
}
