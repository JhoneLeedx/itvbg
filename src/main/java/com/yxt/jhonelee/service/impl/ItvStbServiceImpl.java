package com.yxt.jhonelee.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yxt.jhonelee.mapper.ItvStbDao;
import com.yxt.jhonelee.model.ItvSTB;
import com.yxt.jhonelee.service.ItvStbService;


/**
 * 
 * @author JhoneLee
 *        ItvStb dao层对应的服务层实现类
 */
@Transactional
@Service
public class ItvStbServiceImpl implements ItvStbService {

	@Resource
	private ItvStbDao dao;
	
	public List<ItvSTB> AllItvStb(int startPos, int pageSize) {
		return dao.AllItvStb(startPos, pageSize);
	}

	public int getCount() {
		// TODO Auto-generated method stub
		return dao.getCount();
	}

	public int deleteSTB(int mId) {
		// TODO Auto-generated method stub
		return dao.deleteSTB(mId);
	}

	public int updateSTB(ItvSTB itvstb) {
		// TODO Auto-generated method stub
		return dao.updateSTB(itvstb);
	}

}
