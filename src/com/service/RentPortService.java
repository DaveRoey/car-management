package com.service;


import java.util.List;

import com.pojo.Page;

import com.pojo.RentPort;

/**
 * Created by Dave on 2017/8/8 Describes 出租service接口
 */
public interface RentPortService {

	/**
	 * 添加出租
	 * 
	 * @param rentPort
	 */
	void addRentPort(RentPort rentPort);

	/**
	 * 删除出租记录
	 * 
	 * @param rentId
	 * @return
	 */
	int removeRentPort(int rentId);

	/**
	 * 根据id查找
	 * 
	 * @param rentId
	 * @return
	 */
	List<RentPort> findRentPortByRentId(int rentId);

	/**
	 * 修改出租记录
	 * 
	 * @param rentPort
	 * @return
	 */
	int modifyRentPort(RentPort rentPort);

	Page getApplyPage(int currentPage, int renterId);

	void letterOption(int rentId, String answer, int rentState);
	Page getRenterApplyPage(int currentPage, int renterId);
//求租客停止一个订单	
	void EndTheTrasaction(int rentId);
	void reSendRequest(int rentId,String message);
 Page getRenterRecordPage(int currentPage, int renterId);

}
