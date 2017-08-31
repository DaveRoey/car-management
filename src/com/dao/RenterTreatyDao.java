package com.dao;

import com.pojo.Enterprise;
import com.pojo.RenterTreaty;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by Dave on 2017/8/10
 * Describes 企业租赁合约
 */
public interface RenterTreatyDao extends JpaRepository<RenterTreaty, Integer> {

    /**
     * 根据id查找 合约
     *
     * @param treatyId
     * @return
     */
    RenterTreaty findRenterTreatyByTreatyId(int treatyId);

    /**
     * 获取企业的所有合同
     * @param etpId 企业id
     * @return
     */
    List<RenterTreaty> findRenterTreatiesByEnterpriseEtpId(int etpId);

    /**
     * 检测合同号是否被注册
     *
     * @param treatyNumber
     * @return
     * @author Dave 2017/8/23
     */
    int countRenterTreatyByTreatyNumber(String treatyNumber);

    /**
     * 根据合同编号找合同
     *
     * @param treatyNumber
     * @return
     * @author Dave 2017/8/23
     */
    RenterTreaty findRenterTreatyByTreatyNumber(String treatyNumber);


    /**
     * 根据条件获取总记录数
     *
     * @param state
     * @param etpName
     * @return
     * @author Dave 2017/8/23
     */
    int countRenterTreatyByTreatyStateAndEnterpriseEtpNameLike(Integer state, String etpName);


    /**
     * 根据条件分页获取合同
     *
     * @param state
     * @param etpName
     * @param pageable
     * @return
     * @author Dave 2017/8/23
     */
    List<RenterTreaty> findRenterTreatiesByTreatyStateAndEnterpriseEtpNameLike(Integer state, String etpName, Pageable pageable);

    
   /**
    * 获取企业的所有合同(带分页，杨光)
    * @param etpId 企业id
    * @param pageable 
    * @return
    */
    List<RenterTreaty> findRenterTreatiesByEnterpriseEtpId(int etpId,Pageable pageable);

}
