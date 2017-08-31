package com.service;

import com.pojo.EtpRent;
import com.pojo.Page;

import java.util.List;

/**
 * Created by Dave on 2017/8/23
 * Describes 企业租赁service
 */
public interface EtpRentService {

    /**
     * 添加企业租赁车位
     *
     * @param etpRents
     * @author Dave 2017/8/23
     */
    void addEtpRent(List<EtpRent> etpRents);

    /**
     * 根据合同id查找企业租赁的车位
     *
     * @param treatyId
     * @return
     */
    List<EtpRent> findEtpRentByTreatyId(Integer treatyId, Page page);

    /**
     * 得到总记录数
     *
     * @return
     */
    int getTotalCount(Integer treatyId);

    /**
     * 根据treatyid找到所有的合同车位
     *
     * @param treatyId
     * @return
     * @author Dave 2017/8/23
     */
    List<EtpRent> findEtpRentByTreatyId(Integer treatyId);

    /**
     * 删除合同租赁信息
     *
     * @param etpRent
     * @author Dave 2017/8/23
     */
    void removeEtpRent(EtpRent etpRent);
}
