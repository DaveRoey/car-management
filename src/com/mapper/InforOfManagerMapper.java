package com.mapper;

import org.apache.ibatis.annotations.Update;

import com.pojo.Manage;

public interface InforOfManagerMapper {

	@Update("update manager set password=#{password},phone=#{phone} where empId =#{empId}")
	void updateManage(Manage manage);
}
