package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.InforOfManagerDao;
import com.mapper.InforOfManagerMapper;
import com.pojo.Manage;
import com.service.InforOfManageService;
@Service
public class InforOfManageServiceImpl implements InforOfManageService{
	@Resource
	private InforOfManagerDao inforOfManagerDao;
	@Resource
	private InforOfManagerMapper inforOfManagerMapper;

	@Override
	public Manage findEmpIdAndPasswordAndPhone(int empId) {
		// TODO Auto-generated method stub
		return inforOfManagerDao.findManageByEmpId(empId);
	}

	@Override
	public Manage findEmpIdAndPassword(int empId, String password) {
		// TODO Auto-generated method stub
		return inforOfManagerDao.findManageByEmpIdAndPassword(empId, password);
	}

	@Override
	public void updateManege(Manage manage) {
		// TODO Auto-generated method stub
		inforOfManagerMapper.updateManage(manage);
	}
	

}
