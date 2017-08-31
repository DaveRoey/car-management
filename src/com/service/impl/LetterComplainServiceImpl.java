package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.dao.LetterComplainDao;
import com.pojo.LetterComplain;
import com.pojo.Page;
import com.service.LetterComplainService;

@Service
public class LetterComplainServiceImpl implements LetterComplainService {

	@Resource
	private LetterComplainDao letterComplainDao;
	/**
	 * 包租婆投诉
	 */
	@Override
	public void addLetterComplain(LetterComplain letterComplain) {
		letterComplainDao.saveAndFlush(letterComplain);
	}

	@Override
	public boolean removeLetterComplain(int comId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modifyLetterComplain(LetterComplain letterComplain) {
		// TODO Auto-generated method stub
		return false;
	}

	

}
