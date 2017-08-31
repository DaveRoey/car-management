package com.dao;

import com.pojo.OutTreaty;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by Dave on 2017/8/24
 * Describes 外部合约
 */

public interface OutTreatyDao extends JpaRepository<OutTreaty, Integer> {

    /**
     * 根据合同号查找合同
     *
     * @param treatyNumber
     * @return
     */
    OutTreaty findOutTreatyByTreatyNumber(String treatyNumber);

    /**
     * 根据条件得到总记录数
     *
     * @param treatyState
     * @param companyName
     * @return
     */
    int countByTreatyStateAndCompanyLike(int treatyState, String companyName);

    /**
     * 根据条件获取数据
     *
     * @param treatyState
     * @param companyName
     * @param pageable
     * @return
     */
    List<OutTreaty> findOutTreatyByTreatyStateAndCompanyLike(int treatyState, String companyName, Pageable pageable);
}
