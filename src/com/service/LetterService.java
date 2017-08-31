package com.service;

import java.util.List;

import com.pojo.Letter;
import com.pojo.Page;
import com.pojo.RentPort;

/**
 * Created by Dave on 2017/8/8 Describes
 */
public interface LetterService {
	/**
	 * 娣诲姞鍖呯濠�
	 *
	 * @param letter
	 * @return
	 */
	void addLetter(Letter letter);

	/**
	 * 鍒犻櫎
	 *
	 * @param letter
	 * @return
	 */
	boolean removeLetter(Letter letter);

	/**
	 * 鏍规嵁id鏌ユ壘
	 *
	 * @param letterId
	 * @return
	 */
	Letter findLetterByLetterId(int letterId);

	/**
	 * 鏍规嵁鐢ㄦ埛鍚嶆煡鎵剧敤鎴�
	 *
	 * @param userName
	 * @return
	 */
	Letter findLetterByUserNameAndPassword(String userName,String password);

	/**
	 * 淇敼鍖呯濠嗕俊鎭�
	 *
	 * @param letter
	 * @return
	 */
	boolean modifyLetter(Letter letter);
	
	/**
	 * 包租婆根据用户名密码登录
	 * 
	 */
	public Letter login(String userName,String userPwd);
	
	/**
	 * 查看包租婆的交易记录(杨光)
	 * @param letterID 包租婆id
	 * @param page 分页信息
	 * @return
	 */
	public List<RentPort> findTransHistory(int letterID,Page page);

	/**
	 * 更新包租婆信息
	 * @param letter
	 */
	void updateLetter(Letter letter);
	/**
	 * 获得交易记录页
	 * @param currentPage
	 * @return
	 */
	Page rentPortRecord(int currentPage,Letter letter);
	/**
	 * 验证用户名是否存在（黄赛）
	 */
	Letter regexLetterUserName(String regexUserName);
}
