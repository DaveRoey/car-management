package com.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.pojo.Letter;

/**
 * Created by Dave on 2017/8/8 Describes 鍖呯濠嗘寔涔呭眰dao
 */
@Repository
public interface LetterMapper {
	/**
	 * 娣诲姞鍖呯濠�
	 * 
	 * @param letter
	 * @return
	 */
	@Insert("insert into letter values(default,#{userName},#{password},#{realName},#{address},#{indentNumber},#{phone},#{profession},#{email},default,default,#{state})")
	void insertLetter(Letter letter);

	/**
	 * 鍒犻櫎
	 * 
	 * @param letter
	 * @return
	 */
	int deleteLetter(Letter letter);

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
	Letter findLetterByUserName(String userName);
	
	/**
	 * 淇敼鍖呯濠嗕俊鎭�
	 * 
	 * @param letter
	 * @return
	 */
	@Update("update letter set password=#{password}, address=#{address},phone=#{phone},profession=#{profession},email=#{email} where letterId=#{letterId}")
	int updateLetter(Letter letter);

}
