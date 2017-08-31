 package com.service;

import java.math.BigDecimal;
import java.util.List;

import com.dao.CarPortDao;
import com.pojo.CarPort;
import com.pojo.Letter;
import com.pojo.Page;
import com.pojo.RentPort;

/**
 * Created by Dave on 2017/8/8 Describes 车位service接口
 */
public interface CarPortService {
	/**
	 * 添加用户
	 *
	 * @param carPort
	 */
	void addCarPort(CarPort carPort);

	/**
	 * 删除车位
	 *
	 * @param portId
	 * @return
	 */
	boolean removeCarPort(int portId);

	/**
	 * 根据id查找车位
	 *
	 * @param portId
	 * @return
	 */
	CarPort findCarPortByPortId(int portId);

	/**
	 * 修改车位
	 *
	 * @param carPort
	 * @return
	 */
	boolean modifyCarPort(CarPort carPort);

	/**
	 * 获得page
	 * @param currentPage
	 * @return
	 */
	public List<CarPort> getPage(Page page, String location,int carPortState);
	public List<CarPort> getLetterPage(Page page,int portState,Letter letter);
	
	void auditCarPort(int portId);

	int getTotalCount(int i);//通过portState---i 来找到总记录数

	int getTotalCount(int i, Letter letterId);//通过portState---i 和包租婆ID---letterId来找到总记录数

	Page getLetterCarPort(int currentPage, int letterId);
	
	List<CarPort> findCarPort(Page page,String location,int portState);
	
	int getTotalCountByLocaion(String location,int portState);
	
	void addRenterPort(RentPort rentport);
}
