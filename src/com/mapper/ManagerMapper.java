package com.mapper;

import com.pojo.Manage;
import org.apache.ibatis.annotations.Insert;

/**
 * Created by Dave on 2017/8/21
 * Describes 管理员mapper
 */
public interface ManagerMapper {
    /**
     * 添加管理员
     * @author Dave 2017/8/21
     * @param manage
     */
    @Insert("INSERT INTO manager VALUES (NULL,#{empId},#{password},#{userName},#{phone},#{role},#{flag})")
    void insertManager(Manage manage);


    /**
     * 删除管理员
     * @author Dave 2017/8/21
     * @param managerId
     */
    int deleteManager(int managerId);

    /**
     * 修改管理员
     * @author Dave 2017/8/21
     * @param manage
     * @return
     */
    int updateManager(Manage manage);

}
