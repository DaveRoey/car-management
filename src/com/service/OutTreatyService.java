package com.service;

import com.pojo.OutTreaty;
import com.pojo.Page;
import com.pojo.Renewtreaty;

import java.util.List;

/**
 * Created by Dave on 2017/8/24
 * Describes 外部合约接口
 */
public interface OutTreatyService {
    /**
     * 添加外部合约
     *
     * @param outTreaty
     * @author Dave 2017/8/23
     */
    void addOutTreaty(OutTreaty outTreaty);

    /**
     * 检测合同是否被注册
     *
     * @param treatyNumber
     * @return
     */
    OutTreaty findTreatyByTreatyNumber(String treatyNumber);

    /**
     * 根据条件获取总记录数
     *
     * @param treatyState
     * @param companyName
     * @return
     */
    int getTotalByCondition(Integer treatyState, String companyName);

    /**
     * 分页获取合同数据
     *
     * @param treatyState
     * @param companyName
     * @param page
     * @return
     */
    List<OutTreaty> findTreatyByPage(Integer treatyState, String companyName, Page page);

    /**
     * 根据合同id找到合同
     * @param treatyId
     * @return
     */
    OutTreaty findTreatyByTreatyId(Integer treatyId);

    /**
     * 合同解约
     * @return
     * @param treatyId
     */
    boolean modifyTreatyState(Integer treatyId);

    /**
     * 续约合同
     * @param renewtreaty
     */
    void addNewTreaty(Renewtreaty renewtreaty);

    /**
     * 查看续约的合同
     * @param treatyId
     * @return
     */
    Renewtreaty findNewTreaty(int treatyId);
}
