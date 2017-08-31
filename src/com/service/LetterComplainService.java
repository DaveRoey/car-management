package com.service;

import org.springframework.stereotype.Service;

import com.pojo.LetterComplain;
import com.pojo.Page;

/**
 * Created by Dave on 2017/8/10
 * Describes 包租婆投诉记录service
 */
public interface LetterComplainService {
    /**
     * 添加包租婆投诉记录
     *
     * @param letterComplain
     */
    void addLetterComplain(LetterComplain letterComplain);

    /**
     * 删除投诉记录
     *
     * @param comId
     * @return
     */
    boolean removeLetterComplain(int comId);

    /**
     * 修改投诉
     *
     * @param letterComplain
     * @return
     */
    boolean modifyLetterComplain(LetterComplain letterComplain);

    
	
}
