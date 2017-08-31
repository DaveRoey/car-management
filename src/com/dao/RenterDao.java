package com.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pojo.Renter;

/**
 * Created by Dave on 2017/8/8 Describes 抢租者dao几口
 */
public interface RenterDao extends JpaRepository<Renter, Integer> {
 public Renter findByUserNameAndPassword(String userName,String Password);
 
 Renter findRenterByUserName(String regexUserName);
}
