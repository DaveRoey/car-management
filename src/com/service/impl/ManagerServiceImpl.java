package com.service.impl;

import com.dao.ManagerDao;
import com.mapper.ManagerMapper;
import com.pojo.Manage;
import com.pojo.Page;
import com.service.ManagerService;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Dave on 2017/8/21
 * Describes
 */
@Service
public class ManagerServiceImpl implements ManagerService {

    @Resource
    private ManagerDao dao;
    @Resource
    private ManagerMapper mapper;

    /**
     * 添加管理员
     *
     * @param manage
     * @author Dave 2017/8/21
     */
    @Override
    public void addManager(Manage manage) {
        mapper.insertManager(manage);
    }

    /**
     * 删除管理员
     *
     * @param managerId
     * @return
     * @author Dave 2017/8/21
     */
    @Override
    public boolean deleteManager(int managerId) {
        return mapper.deleteManager(managerId) > 0;
    }

    /**
     * 修改管理员
     *
     * @param manage
     * @return
     * @author Dave 2017/8/21
     */
    @Override
    public boolean updateManger(Manage manage) {
        return mapper.updateManager(manage) > 0;
    }

    /**
     * 根据姓名模糊查询
     *
     * @param userName
     * @return
     * @author Dave 2017/8/21
     */
    @Override
    public List<Manage> findManagesByUserName(String userName, Page page) {
        PageRequest request = new PageRequest(page.getCurrentPage() - 1, page.getPageSize());
        return dao.findManagesByUserNameLikeAndFlag("%" + userName + "%",0, request);
    }

    /**
     * 根据姓名获得总记录数
     *
     * @param userName
     * @return
     */
    @Override
    public int getManageCountByName(String userName) {
        return dao.countByUserNameLikeAndFlag("%" + userName + "%",0);
    }

    /**
     * 根据工号判断账号是否存在
     *
     * @param empId
     * @return
     */
    @Override
    public boolean findManagerExist(int empId) {
        return dao.countByEmpId(empId) > 0;
    }

    /**
     * 根据工号密码查找账户
     *
     * @param empId
     * @param password
     * @return
     * @author Dave 2017/8/21
     */
    @Override
    public Manage findManageByEmpIdAndPassword(int empId, String password) {
        return dao.findManageByEmpIdAndPassword(empId, password);
    }

    /**
     * 根据工号查找管理员
     *
     * @param empId
     * @return
     */
    public Manage findManageByEmpId(int empId) {
        return dao.findManageByEmpId(empId);
    }
}
