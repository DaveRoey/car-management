package com.dao;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.pojo.LetterComplain;

public interface LetterComplainManagerDao extends JpaRepository<LetterComplain,Integer>{

	 /**
     * 根据投诉记录状态 分页查询
     * @param comState
     * @return
     */
    List<LetterComplain> findLetterComplainsByComState(int comState, Pageable pageable);


    /**
     * 根据状态获得总记录数
     * @param state
     * @return
     */
	int countByComState(int state);
}
