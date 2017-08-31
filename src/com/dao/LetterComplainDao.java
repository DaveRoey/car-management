package com.dao;

import com.pojo.LetterComplain;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by Dave on 2017/8/10
 * Describes 包租婆投诉记录dao接口
 */
public interface LetterComplainDao extends JpaRepository<LetterComplain,Integer> {

    /**
     * 根据comId查找记录
     * @param comId
     * @return
     */
    LetterComplain findLetterComplainByComId(int comId);


   


}
