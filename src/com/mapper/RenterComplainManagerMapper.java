package com.mapper;

import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.pojo.RenterComplain;

@Repository
public interface RenterComplainManagerMapper {

	@Update("update rentercomplain set comState=#{comState} where comId=#{comId}")
	void updateRenter(RenterComplain renterComplain);
	

	
}
