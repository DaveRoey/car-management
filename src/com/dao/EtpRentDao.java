package com.dao;

import com.pojo.EtpRent;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by Dave on 2017/8/23
 * Describes 企业租赁Dao
 */
public interface EtpRentDao extends JpaRepository<EtpRent,Integer> {

    /**
     * 根据合同号查找
     * @param treatyId
     * @return
     */
    List<EtpRent> findEtpRentsByRenterTreatyTreatyId(int treatyId, Pageable pageable);

    /**
     * 得到总记录数
     * @param treatyId
     * @return
     */

    int countByRenterTreatyTreatyId(Integer treatyId);

    /**
     * 根据合同id得到所有租赁信息
     * @param treatyId
     * @return
     */
    List<EtpRent> findEtpRentsByRenterTreatyTreatyId(Integer treatyId);
}
