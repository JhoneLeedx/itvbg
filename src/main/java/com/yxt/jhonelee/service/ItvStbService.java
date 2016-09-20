package com.yxt.jhonelee.service;

import java.util.List;

import com.yxt.jhonelee.model.ItvSTB;

public interface ItvStbService {
	
	public List<ItvSTB> AllItvStb(int startPos, int pageSize);

	public int getCount();

	public int deleteSTB(int mId);// 删除id对应的数据

	public int updateSTB(ItvSTB itvstb);// 更新id对应的数据

	public List<ItvSTB> vagueSelect(int startPos, int pageSize, String mCode);// 模糊查询分页

	public int vagueGetCount(String mCode);// 模糊查询总数
	
	public ItvSTB selectOneStb(int mId);//查询一个数据
}
