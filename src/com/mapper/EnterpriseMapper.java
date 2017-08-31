package com.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;

import com.pojo.Enterprise;

/**
 * Created by Dave on 2017/8/10
 * Describes 企业mapper接口
 */
public interface EnterpriseMapper {
    /**
     * 添加企业用户
     *
     * @param enterprise
     */
    @Insert("insert into enterprise values(default,#{userName},#{password},#{etpName},#{location},#{contact},#{phone})")
    void insertEnterprise(Enterprise enterprise);

    /**
     * 删除企业账户
     *
     * @param etpId
     * @return
     */
    @Delete("DELETE FROM enterprise WHERE etpId=#{etpId}")
    int deleteEnterprise(int etpId);

    /**
     * 修改企业信息
     *
     * @param enterprise
     * @return
     */
    int updateEnterprise(Enterprise enterprise);
    
}
