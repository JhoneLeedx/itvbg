package com.yxt.jhonelee.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yxt.jhonelee.mapper.ItvStbDao;
import com.yxt.jhonelee.model.ItvSTB;
import com.yxt.jhonelee.service.ItvStbService;

@Transactional
@Service
public class ItvStbServiceImpl implements ItvStbService {

	@Resource
	private ItvStbDao dao;
	
	public List<ItvSTB> AllItvStb(int startPos, int pageSize) {
		return dao.AllItvStb(startPos, pageSize);
	}

}
