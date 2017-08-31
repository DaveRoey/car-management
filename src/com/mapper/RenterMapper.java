package com.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import com.pojo.Renter;

/**
 * Created by Dave on 2017/8/8 Describes 鎶㈢鑰卍ao鍑犲彛
 */
public interface RenterMapper {
	/**
	 * 娣诲姞鎶㈢鑰�
	 * 
	 * @param renter
	 * @return
	 */
	@Insert("insert into renter values(default,#{userName},#{password},#{realName},#{address},#{indentNumber},#{phone},#{profession},#{email},default,default,#{state})")
	void insertRenter(Renter renter);
          
	/**
	 * 鍒犻櫎
	 * 
	 * @param renter
	 * @return
	 */
	int deleteRenter(Renter renter);

	/**
	 * 鏍规嵁id鏌ユ壘
	 * 
	 * @param renterId
	 * @return
	 */
	Renter findRenterByRenterId(int renterId);

	/**
	 * 鏍规嵁鐢ㄦ埛鍚嶆煡鎵剧敤鎴�
	 * 
	 * @param userName
	 * @return
	 */
	Renter findRenterByUserName(String userName);

	/**
	 * 淇敼鎶㈢鑰�
	 * 
	 * @param renter
	 * @return
	 */
	@Update("update renter set password=#{password}, address=#{address},phone=#{phone},profession=#{profession},email=#{email} where letterId=#{renterId}")
	int updateRenter(Renter renter);
}
