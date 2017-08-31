package com.service;

import com.pojo.Page;
import com.pojo.RenterComplain;

/**
 * Created by Dave on 2017/8/10
 * Describes 抢租者投诉记录表
 */
public interface RenterComplainService {
    /**
     * 添加抢租客投诉记录
     *
     * @param renterComplain
     */
    void addRenterComplain(RenterComplain renterComplain );

    /**
     * 删除投诉记录
     *
     * @param comId
     * @return
     */
    int removeRenterComplain(int comId);

    /**
     * 修改投诉
     *
     * @param renterComplain
     * @return
     */
    int modifyRenterComplain(RenterComplain renterComplain);

    
}
