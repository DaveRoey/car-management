package com.dao;

import com.pojo.Manage;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

/**
 * Created by Dave on 2017/8/21
 * Describes 管理员dao
 */
public interface ManagerDao extends JpaRepository<Manage, Integer> {

    /**
     * 根据真实名字查找管理员用户
     *
     * @param userName
     * @return
     * @author Dave  2017/8/21
     */
    List<Manage> findManagesByUserNameLikeAndFlag(String userName,int flag ,Pageable pageable);

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
     * 查询工号是否存在
     *
     * @param empId
     * @return
     * @author Dave  2017/8/21
     */
    int countByEmpId(int empId);

    /**
     * 根据名字获取总页数
     * @param userName
     * @author Dave  2017/8/21
     * @return
     */
    int countByUserNameLikeAndFlag(String userName,int flag);

    /**
     * 根据工号id查找管理员
     * @param empId
     * @author Dave  2017/8/21
     * @return
     */
    Manage findManageByEmpId(int empId);

}
