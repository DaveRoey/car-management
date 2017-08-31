package com.service;

import com.pojo.Manage;
import com.pojo.Page;

import java.util.List;

/**
 * Created by Dave on 2017/8/21
 * Describes
 */
public interface ManagerService {
    /**
     * 添加管理员
     *
     * @param manage
     * @author Dave 2017/8/21
     * @author Dave 2017/8/21
     */
    void addManager(Manage manage);

    /**
     * 删除管理员
     *
     * @param managerId
     * @return
     * @author Dave 2017/8/21
     * @author Dave 2017/8/21
     */
    boolean deleteManager(int managerId);


    /**
     * 修改管理员
     *
     * @param manage
     * @return
     * @author Dave 2017/8/21
     * @author Dave 2017/8/21
     */
    boolean updateManger(Manage manage);


    /**
     * 根据真实名字模糊查找管理员用户
     *
     * @param userName
     * @return
     * @author Dave  2017/8/21
     */
    List<Manage> findManagesByUserName(String userName,Page page);

    /**
     * 根据工号密码查找管理员
     *
     * @param empId
     * @param password
     * @return
     * @author Dave  2017/8/21
     */
    Manage findManageByEmpIdAndPassword(int empId, String password);


    /**
     * 根据工号判断是否存在
     * @author Dave  2017/8/21
     * @param empId
     * @return
     */
    boolean findManagerExist(int empId);


    /**
     * 根据名字得到总记录数
     * @param userName
     * @author Dave  2017/8/21
     * @return
     */
    int getManageCountByName(String userName);


    /**
     * 根据工号查找管理员
     * @param empId
     * @return
     */
    Manage findManageByEmpId(int empId);
}
