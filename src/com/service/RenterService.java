package com.service;

import java.util.List;

import com.pojo.Letter;
import com.pojo.Page;
import com.pojo.RentPort;
import com.pojo.Renter;

/**
 * Created by Dave on 2017/8/8 Describes 鎶㈢鑰卻ervice鎺ュ彛
 */
public interface RenterService {
	/**
	 * 娣诲姞鎶㈢鑰�
	 * 
	 * @param renter
	 * @return
	 */
	void addRenter(Renter renter);

	/**
	 * 鍒犻櫎
	 * 
	 * @param renter
	 * @return
	 */
	int removeRenter(Renter renter);

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
	Renter findRenterByUserNameAndPassword(String userName,String Password);

	/**
	 * 淇敼鎶㈢鑰�
	 * 
	 * @param renter
	 * @return
	 */
	int modifyRenter(Renter renter);
	
	/**
	 * 得到租客的交易历史记录(杨光)
	 * @param renterId （租客id）
	 * @param page 分页信息
	 * @return
	 */
	public List<RentPort> findTransHistory(int renterId,Page<Integer> page);
	
	void updateLetter(Renter renter);
	
	/**
	 * 验证用户名是否存在（黄赛）
	 */
	Renter regexRenterUserName(String regexUserName);
}
