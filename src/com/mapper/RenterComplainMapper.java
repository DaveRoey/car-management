package com.mapper;

import com.pojo.RenterComplain;

/**
 * Created by Dave on 2017/8/10
 * Describes 抢租客投诉记录
 */
public interface RenterComplainMapper {
    /**
     * 添加抢租客投诉记录
     *
     * @param renterComplain
     */
    void insertRenterComplain(RenterComplain renterComplain );

    /**
     * 删除投诉记录
     *
     * @param comId
     * @return
     */
    int deleteRenterComplain(int comId);

    /**
     * 修改投诉
     *
     * @param renterComplain
     * @return
     */
    int updateRenterComplain(RenterComplain renterComplain);
}
