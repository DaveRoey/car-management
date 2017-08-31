package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.pojo.User;

public interface UserMapper {
	@Select("select * from users where user_name=#{userName} and user_pwd=#{userPwd}")
	@Results({
		 @Result(id = true, column = "user_id", property = "userId"),   
	        @Result(column = "user_name", property = "userName"),
	        @Result(column = "user_pwd", property = "userPwd"),
	        @Result(column = "user_email", property = "userEmail"),   
	})
	public User findOne(@Param(value = "userName")String userName, @Param(value = "userPwd")String userPwd);
	
}

