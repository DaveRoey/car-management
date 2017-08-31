package com.dao;

import com.pojo.Enterprise;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by Dave on 2017/8/10
 * Describes 企业dao层接口
 */
public interface EnterpriseDao extends JpaRepository<Enterprise,Integer> {
    /**
     * 根据id查找企业
     * @param etpId
     */
    Enterprise findEnterpriseByEtpId(int etpId);

    /**
     * 根据公号码查找用户 可以用来登录与判断是否被注册
     * @param userName
     */
    Enterprise findEnterpriseByUserName(String userName);

    /**
     * 根据公司地址  公司名称 联系人 联系电话  模糊分页查询
     * @param location
     * @param etpName
     * @param contact
     * @param phone
     * @return
     */
    List<Enterprise> findEnterprisesByLocationLikeAndEtpNameLikeAndContactLikeAndPhoneLike(String location, String etpName,String contact,String phone,Pageable pageable);

    int countByLocationLikeAndEtpNameLikeAndContactLikeAndPhoneLike(String location, String etpName,String contact,String phone);
    
    /**
     * 登陆验证（杨光）
     * @param userName
     * @param password
     * @return
     */
    Enterprise findEnterpriseByUserNameAndPassword(String userName,String password);
}
