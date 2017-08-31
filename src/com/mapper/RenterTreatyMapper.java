package com.mapper;

import com.pojo.RenterTreaty;
import org.apache.ibatis.annotations.Delete;

/**
 * Created by Dave on 2017/8/10
 * Describes 企业合约mapper
 */
public interface RenterTreatyMapper {
    /**
     * 添加合约
     * @param treaty
     */
    void insertRenterTreaty(RenterTreaty treaty);

    /**
     * 根据合约id删除合约
     * @param treatyId
     * @return
     */
    @Delete("DELETE FROM rentertreaty WHERE treatyId=#{treatyId}")
    int deleteRenterTreaty(int treatyId);

    /**
     * 修改合约
     * @param treaty
     * @return
     */
    int updateRenterTreaty(RenterTreaty treaty);

}
