package com.dao;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.pojo.RenterComplain;

/**
 * 强租客投诉管理
 * @author Administrator
 *
 */
public interface RenterComplainManagerDao extends JpaRepository<RenterComplain,Integer> {

	/**
     * 根据投诉记录状态 分页查询
     * @param comState
     * @return
     */
    List<RenterComplain> findRenterComplainsByComState(int comState, Pageable pageable);

    /**
     * 根据投诉状态获得总记录数
     * @param comState
     * @return
     */
	int countByComState(int comState);

	
}
