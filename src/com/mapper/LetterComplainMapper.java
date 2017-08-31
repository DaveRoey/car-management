package com.mapper;

import com.pojo.LetterComplain;

/**
 * Created by Dave on 2017/8/10
 * Describes 包租婆投诉记录mapper接口
 */
public interface LetterComplainMapper {
    /**
     * 添加包租婆投诉记录
     *
     * @param letterComplain
     */
    void insertLetterComplain(LetterComplain letterComplain );

    /**
     * 删除投诉记录
     *
     * @param comId
     * @return
     */
    int deleteLetterComplain(int comId);

    /**
     * 修改投诉
     *
     * @param letterComplain
     * @return
     */
    int updateLetterComplain(LetterComplain letterComplain);

}
