package com.yxt.jhonelee.service;

import java.util.List;

import com.yxt.jhonelee.model.ItvSTB;

public interface ItvStbService {
	public List<ItvSTB> AllItvStb(int startPos, int pageSize);

	public int getCount();

	public int deleteSTB(int mId);// 删除id对应的数据

	public int updateSTB(ItvSTB itvstb);// 更新id对应的数据
}
