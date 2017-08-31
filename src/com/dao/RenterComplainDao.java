package com.dao;

import com.pojo.RenterComplain;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by Dave on 2017/8/10
 * Describes  抢租客投诉记录表
 */
public interface RenterComplainDao extends JpaRepository<RenterComplain,Integer> {

    /**
     * 根据comId查找记录
     * @param comId
     * @return
     */
    RenterComplain findRenterComplainByComId(int comId);

    /**
     * 根据投诉记录状态 分页查询
     * @param comState
     * @return
     */
    List<RenterComplain> findRenterComplainsByComState(int comState, Pageable pageable);

    
}
