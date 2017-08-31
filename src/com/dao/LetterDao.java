package com.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pojo.Letter;
import com.pojo.RentPort;

/**
 * Created by Dave on 2017/8/8 Describes 包租婆持久层dao
 */
public interface LetterDao extends JpaRepository<Letter, Integer> {
   Letter findLetterByUserNameAndPassword(String username,String password);

   Letter findLetterByUserName(String regexUserName);

}
