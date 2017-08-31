package com.mapper;

import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.pojo.LetterComplain;


@Repository
public interface LetterComplainManagerMapper {

	@Update("update lettercomplain set comState=#{comState} where comId=#{comId}")
	void updateLetter(LetterComplain letterComplain);
}
