package com.dao;

import com.pojo.Renewtreaty;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Dave on 2017/8/25
 * Describes 续约外部合同
 */
public interface RenewTreatyDao extends JpaRepository<Renewtreaty,Integer> {

    /**
     * 根据外部合同找到续约的合同
     * @param treatyId
     * @return
     */
    Renewtreaty findRenewtreatyByTreatyTreatyId(int treatyId);
}
