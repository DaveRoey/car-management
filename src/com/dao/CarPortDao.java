package com.dao;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.pojo.CarPort;
import com.pojo.Letter;
import com.pojo.Page;

/**
 * Created by Dave on 2017/8/8 Describes 杞︿綅dao灞傛帴鍙�
 */
public interface CarPortDao extends JpaRepository<CarPort, Integer> {

	/**
	 * @param location 地址（模糊查询用）
	 * @param portState 车位状态
	 * @param page 分页参数
	 * @return 当前页车位集合
	 */
	List<CarPort> findCarPortByLocationLikeAndPortState(String location,int portState,Pageable page);

	
	/**
	 * 查询状态来查询车位数量(杨光)
	 * @param portState
	 * @return
	 */
	int countByPortState(int portState);
	
	int countByPortStateAndLetterLetterId(int portState, int letter_id);
	
	/**
	 * 
	 * @param portState 车位状态
	 * @param letter_id 包租婆
	 * @return 总记录数
	 */
	int countByPortStateLessThanAndLetter(int portState, Letter letter_id);
	/**
	 * 
	 * @param portState 车位状态
	 * @param location 地址（模糊查询用）
	 * @param page 分页参数
	 * @return 当前页车位集合
	 */
	List<CarPort> findCarPortsByPortStateAndLocationLike(int portState,String location,Pageable page);
	/**
	 * 
	 * @param portState 车位状态
	 * @param location 地址（模糊查询用）
	 * @return	总记录数
	 */
	int countByPortStateAndLocationLike(int portState,String location);
	/**
	 * 根据车辆状态和包租婆Id查询车辆
	 * @param portState
	 * @param letterId
	 * @param request
	 * @return
	 */
	List<CarPort> findCarPortsByPortStateLessThanAndLetterLetterId(int portState,
			int letterId, Pageable request);
	/**
	 * 
	 * @param portId 车位编号
	 * @return 车位
	 */
	CarPort findCarPortByPortId(int portId);
	
	/**
	 * 获得包租婆的所有车位
	 * @param letter
	 * @return
	 */
	List<CarPort> findCarPortsByLetter(Letter letter);


	
	/**
	 * 根据车位状态来查询车辆信息（杨光）
	 * @param portState
	 * @return
	 */
	List<CarPort> findCarPortByPortState(int portState,Pageable pageable
			);

}
