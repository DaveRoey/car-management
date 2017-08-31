package com.service;

import com.pojo.Enterprise;
import com.pojo.Page;

import java.util.List;

/**
 * Created by Dave on 2017/8/10
 * Describes 企业用户服务层
 */
public interface EnterpriseService {

    /**
     * 添加企业用户
     *
     * @param enterprise
     */
    void addEnterprise(Enterprise enterprise);

    /**
     * 删除企业账户
     *
     * @param etpId
     * @return
     */
    boolean removeEnterprise(int etpId);

    /**
     * 修改企业信息
     *
     * @param enterprise
     * @return
     */
    boolean modifyEnterprise(Enterprise enterprise);


    /**
     * 根据id查找企业
     *
     * @param etpId
     */
    Enterprise findEnterpriseByEtpId(int etpId);

    /**
     * 根据公号码查找用户 可以用来登录与判断是否被注册
     *
     * @param userName
     */
    Enterprise findEnterpriseByUserName(String userName);

    /**
     * 根据公司地址 与 公司名称 模糊分页查询
     *
     * @param location
     * @param etpName
     * @return
     */
    List<Enterprise> findEnterprisesByLocationLikeAndEtpNameLikeAndContactLikeAndPhoneLike(String location, String etpName,String contact,String phone, Page<Enterprise> page);
    
    int getTotalCountByLocationLikeAndEtpNameLikeAndContactLikeAndPhoneLike(String location, String etpName,String contact,String phone);
    
    /**
     * 修改密码
     * @param userId 用户id
     * @param newpwd 新密码（需要加密）
     */
    public boolean changePwd(int userId,String newpwd,String oldpwd);
    
    /**
     * 登陆验证（杨光）
     * @param userName
     * @param password
     * @return
     */
    public Enterprise login(String userName,String password);
}
