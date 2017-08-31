package com.dao;

import java.util.List;


import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pojo.Letter;
import com.pojo.RentPort;
import com.pojo.Renter;

/**
 * Created by Dave on 2017/8/8 Describes 出租记录dao层接口（订单的操作）
 */
public interface RentPortDao extends JpaRepository<RentPort, Integer> {
   /*  public List<RentPort>  findByRenterRentId(int renterId);*/
	int countByRenter(Renter renter);
	
/*	*//**
	 * 根据rentState = 0和包租婆获得总记录数
	 * 
	 * @param rentState
	 * @param letter
	 * @return
	 *//*
	int countByRentStateAndLetter(int rentState, Letter letter);*/

	/**
	 * 通过包租婆id查询包租婆的订单列表，带分页（杨光）
	 * @param letterId
	 * @param rentState:订单状态 0 预定车位（默认） 1  同意出租  2包租婆拒绝（丑拒）3交易完成',
	 * @return
	 */
	public List<RentPort> findRentPortsByCarPortLetterLetterIdAndRentState(int letterId,Pageable request,int rentState);
	

	/**
	 * 通过租客Id查询租客的订单列表,带分页（杨光）
	 * @param renterId
	 * @param rentState 订单状态 0 预定车位（默认） 1  同意出租  2包租婆拒绝（丑拒）3交易完成',
	 * @return
	 */
	public List<RentPort> findRentPortsByRenterRenterIdAndRentState(int renterId,Pageable request,int rentState);

	List<RentPort> findRentPortsByRenterRenterIdAndRentStateBetween(int renterId,Pageable request,int a ,int b);

	/**
	 * 根据rentState和包租婆获得记录数
	 * 
	 * @param rentState =  0
	 * @param letterId
	 * @return
	 */
	int countByRentStateAndCarPortLetterLetterId(int rentState, int letterId);

	
	
}
