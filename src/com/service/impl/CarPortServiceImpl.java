
package com.service.impl;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.dao.CarPortDao;
import com.dao.LetterDao;
import com.dao.RentPortDao;
import com.dao.RenterDao;
import com.mapper.CarPortMapper;
import com.mapper.RentPortMapper;
import com.pojo.CarPort;
import com.pojo.Letter;
import com.pojo.Page;
import com.pojo.RentPort;
import com.service.CarPortService;

@Service
public class CarPortServiceImpl implements CarPortService {

	@Resource
	private CarPortDao carPortDao;//�?
	@Resource
	private CarPortMapper carportmapper;//增�?�删、改
	@Resource
	private LetterDao letterDao;
	@Resource
	private RenterDao renterDao;
	@Resource
	private RentPortDao rentPortDao;
	@Resource
	private RentPortMapper rentPortMapper;
	
	@Override
	public void addCarPort(CarPort carPort) {
		//
		carPortDao.saveAndFlush(carPort);
	}

	@Override
	public boolean removeCarPort(int portId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public CarPort findCarPortByPortId(int portId) {
		// TODO Auto-generated method stub
		return carPortDao.findCarPortByPortId(portId);
	}

	@Override
	public boolean modifyCarPort(CarPort carPort) {
		
		return false;
	}
	@Override
	public List<CarPort> getPage(Page page, String location,int portState) {
		PageRequest request;
		
			 request=new PageRequest(page.getCurrentPage()-1, page.getPageSize());
		
		return carPortDao.findCarPortByLocationLikeAndPortState(location,portState, request);
	}
	/**
	 * 通过车位状态和包租婆找到当前页集合
	 */
	@Override
	public List<CarPort> getLetterPage(Page page,int portState,Letter letter_id) {
		
		PageRequest request=new PageRequest(page.getCurrentPage()-1, page.getPageSize());
		List<CarPort> list=carPortDao.findCarPortsByPortStateLessThanAndLetterLetterId(portState,letter_id.getLetterId(), request);
		return list;
	}
	@Override
	public void auditCarPort(int portId) {
		CarPort carPort = carPortDao.findOne(portId);
		carPort.setPortState(1);
		carportmapper.updateCarPort(carPort);
	}
	@Override
	public int getTotalCount(int i) {
		
		return carPortDao.countByPortState(i);
		
	}

	/**
	 * 
	 * 
	 * 通过portState与letter找到小于该portState总记录数
	 */
	public int getTotalCount(int portState, Letter letter_id) {
	
		return carPortDao.countByPortStateLessThanAndLetter(portState,letter_id);
	}
	/**
	 * 通过当前页和letterId得到Page
	 */
	@Override
	public Page<CarPort> getLetterCarPort(int currentPage, int letterId) {
		Letter letter = letterDao.findOne(letterId);//通过id找到包租婆
		
		Page<CarPort> page = new Page<CarPort>();
		page.setTotalRecord(getTotalCount(2,letter));//portState and letterId
		page.setCurrentPage(currentPage);
		List<CarPort> list = getLetterPage(page,2,letter);
		
		page.setList(list);
		return page;
	}
	
	//分页模糊查询
	@Override
	public List<CarPort> findCarPort(Page page,String location,int portState) {

		// TODO Auto-generated method stub

		System.out.println(page.getStartIndex()+""+page.getPageSize());
		PageRequest request=new PageRequest(page.getCurrentPage()-1, page.getPageSize());
		return carPortDao.findCarPortsByPortStateAndLocationLike(portState,"%"+location+"%",request);
	}
	//查找没有预约出去的所有+模糊查询分页
	@Override
	public int getTotalCountByLocaion(String location,int portState) {
		// TODO Auto-generated method stub
		return carPortDao.countByPortStateAndLocationLike(portState,"%"+location+"%");
	}
	//预约
	@Override
	public void addRenterPort(RentPort rentport) {
		// TODO Auto-generated method stub
		rentPortMapper.insertintoRentPort(rentport);
	}
	

}
