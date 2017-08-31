package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.pojo.CarPort;
import com.pojo.Page;

/**
 * Created by Dave on 2017/8/8 Describes 车位dao层接口
 */
public interface CarPortMapper {
	/**
	 * 添加车位（车位信息：propNumber:产权证照片;location:地址）
	 *
	 * @param carPort
	 * 
	 */
	@Insert(value="insert into carport values (null,#{propNumber},#{location},#{portNumber},#{propImage},#{startTime},#{endTime},#{price},null,#{letter.letterId})")
	void insertCarPort(CarPort carPort);

	/**
	 * 删除车位
	 * 
	 * @param portId
	 * @return
	 */
	int deleteCarPort(int portId);

	/**
	 * 根据id查找车位
	 * 
	 * @param portId
	 * @return
	 */
	CarPortMapper findCarPortByPortId(int portId);

	/**
	 * 修改车位
	 * 
	 * @param carPort
	 * @return
	 */
	@Update("update carport set portState=#{portState} where portId =#{portId }")
	int updateCarPort(CarPort carPort);


	
}
