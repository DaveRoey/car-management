package com.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.RenterComplainDao;
import com.pojo.Page;
import com.pojo.RenterComplain;
import com.service.RenterComplainService;
@Service
public class RenterComplainServiceImpl implements RenterComplainService{
	@Resource
	private RenterComplainDao renterComplainDao;
	//传递抢租客投诉
	@Override
	public void addRenterComplain(RenterComplain renterComplain) {
		// TODO Auto-generated method stub
		renterComplainDao.saveAndFlush(renterComplain);
	}

	@Override
	public int removeRenterComplain(int comId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyRenterComplain(RenterComplain renterComplain) {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
