package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.dao.LetterDao;
import com.dao.RentPortDao;
import com.mapper.LetterMapper;
import com.pojo.Letter;
import com.pojo.LetterComplain;
import com.pojo.Page;
import com.pojo.RentPort;
import com.service.LetterService;
@Service("letterServiceImpl")
public class LetterServiceImpl implements LetterService {
    @Resource(name="letterMapper") 
	private LetterMapper mapper;
    @Resource(name="letterDao")
    private LetterDao lDao;
    
    @Resource
    private RentPortDao rentPortDao;
	@Override
	public void addLetter(Letter letter) {
		
		mapper.insertLetter(letter);
	
	}

	@Override
	public boolean removeLetter(Letter letter) {
		
		return false;
	}

	@Override
	public Letter findLetterByLetterId(int letterId) {
		
		return null;
	}


	@Override
	public boolean modifyLetter(Letter letter) {
		
		return false;
	}

	@Override
	public Letter findLetterByUserNameAndPassword(String userName, String password) {
		
	Letter letter=lDao.findLetterByUserNameAndPassword(userName, password);
		return letter;
	}

	@Override
	public Letter login(String userName, String userPwd) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RentPort> findTransHistory(int letterId,Page page) {
		// TODO Auto-generated method stub
		
		
		Pageable pageable=new PageRequest(page.getCurrentPage()-1,page.getPageSize());
		
		//Pageable pageable=new PageRequest(page.getCurrentPage()-1,page.getPageSize());
		
		List<RentPort> list=rentPortDao.findRentPortsByCarPortLetterLetterIdAndRentState(1, pageable, 3);
		
		return list;
	}

	@Override
	public void updateLetter(Letter letter) {
		mapper.updateLetter(letter);
		
	}

	
	/**
	 * 获得包租婆历史纪录
	 */
	@Override
	public Page<RentPort> rentPortRecord(int currentPage,Letter letter) {
		
		Page page = new Page();
		page.setTotalRecord(getTotalCountByRentState(3,letter));
		page.setCurrentPage(currentPage);
		Pageable pageable=new PageRequest(page.getCurrentPage()-1,page.getPageSize());
		List<RentPort> list = rentPortDao.findRentPortsByCarPortLetterLetterIdAndRentState(letter.getLetterId(),pageable,3);
		page.setList(list);
		
		return page;
	}

	/**
	 * 根据rentState获得总记录数
	 * @param i
	 * @return
	 */
	private int getTotalCountByRentState(int rentState,Letter letter) {
		int total = rentPortDao. countByRentStateAndCarPortLetterLetterId(rentState,letter.getLetterId());
		
		return total;
	}
	/**
	 * 验证letter用户名是否存在（黄赛）
	 */
	@Override
	public Letter regexLetterUserName(String regexUserName) {
		// TODO Auto-generated method stub
		return lDao.findLetterByUserName(regexUserName);
	}

}
