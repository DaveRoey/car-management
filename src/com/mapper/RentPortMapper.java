package com.mapper;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import com.pojo.RentPort;

/**
 * Created by Dave on 2017/8/8 Describes 出租记录dao层接口
 */
public interface RentPortMapper {

	/**
	 * 添加出租
	 * 
	 * @param rentPort
	 */
	void insertRentPort(RentPort rentPort);

	/**
	 * 删除出租记录
	 * 
	 * @param rentId
	 * @return
	 */
	int deleteRentPort(int rentId);

	/**
	 * 根据id查找
	 * 
	 * @param rentId
	 * @return
	 */
	
	RentPort findRentPortByRentId(int rentId);

	/**
	 * 修改出租记录
	 * 
	 * @param rentPort
	 * @return
	 */
	@Update("update rentport set answer=#{answer},rentState=#{rentState},describes=#{describes} where rentId=#{rentId}")
	int updateRentPort(RentPort rentPort);
    @Update("update rentport set rentState=3,endDate=now() where rentId=#{rentId}")
	void changeRentPort(int rentId);
    @Update("update rentport set rentState=0,message=#{message} where rentId=#{rentId}")
    void modifyRentPort(@Param(value="rentId")int rentId,@Param(value="message")String message);
    //预约增加message，rentState，renter_id，port_id
    @Insert("insert into rentport(message,rentState,renter_id,port_id) values (#{message},#{rentState},#{renter.renterId},#{carPort.portId})")
	void insertintoRentPort(RentPort rentPort);
}
