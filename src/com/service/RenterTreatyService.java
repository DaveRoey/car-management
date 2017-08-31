package com.service;

import com.pojo.*;

import java.util.List;

/**
 * Created by Dave on 2017/8/10
 * Describes 企业租赁合约service
 */
public interface RenterTreatyService {
    /**
     * 根据id查找 合约
     *
     * @param treatyId
     * @return
     * @author Dave 2017/8/22
     */
    RenterTreaty findRenterTreatyByTreatyId(int treatyId);

    /**
     * 获取企业的所有合同
     *
     * @param enterprise
     * @return
     * @author Dave 2017/8/22
     */
    List<RenterTreaty> findRenterTreatiesByEnterprise(Enterprise enterprise);

    /**
     * 添加合约
     *
     * @param treaty
     */
    void addRenterTreaty(RenterTreaty treaty);

    /**
     * 根据合约id删除合约
     *
     * @param treatyId
     * @return
     * @author Dave 2017/8/22
     */
    boolean removeRenterTreaty(int treatyId);

    /**
     * 修改合约
     *
     * @param treaty
     * @return
     * @author Dave 2017/8/22
     */
    boolean modifyRenterTreaty(RenterTreaty treaty);

    /**
     * 获得所有的企业
     *
     * @return
     * @author Dave 2017/8/22
     */
    List<Enterprise> findAllEnterprise();

    /**
     * 获得所有的车位地址
     *
     * @return
     * @author Dave 2017/8/22
     */
    List<SystemPort> findCartPortAddress();

    /**
     * 根据地址获取车位信息
     *
     * @param portAddress
     * @return
     * @author Dave 2017/8/23
     */
    List<SystemPort> findCartPortByAddress(String portAddress);

    /**
     * 检测合同号是否已存在
     *
     * @param treatyNumber
     * @return
     * @author Dave 2017/8/23
     */
    boolean checkTreatyExist(String treatyNumber);


    /**
     * 添加合同车位
     *
     * @param treatyNumber
     * @param carPorts
     * @author Dave 2017/8/23
     */
    void addTreatyCarts(String treatyNumber, Integer[] carPorts);

    /**
     * 分页获取合同
     *
     * @param page
     * @param state
     * @param etpName
     */
    List<RenterTreaty> findRenterTreatyByPage(Page<RenterTreaty> page, Integer state, String etpName);

    /**
     * 根据条件得到总页数
     *
     * @param etpName
     * @param state
     * @return
     */
    int getCountByEtpName(String etpName, Integer state);

    /**
     * 根据合同id查找企业租赁车位
     *
     * @param treatyId
     * @return
     * @author Dave 2017/8/23
     */
    List<EtpRent> findEtpRentByTreatyId(Integer treatyId,Page page);

    /**
     * 得到总记录数
     * @author Dave 2017/8/23
     * @return
     */
    int getTotalCount(Integer treatyId);

    /**
     * 根据租赁编号得到所有的租赁车位
     * @param treatyId
     * @return
     */
    List<EtpRent> findEtpRentByTreatyId(Integer treatyId);

    /**
     * 删除合同
     * @return
     * @param treaty
     */
    boolean removeTreatyAndModifyCarState(RenterTreaty treaty);
    
    /**
     * 分页获取合同（杨光）(未完成)
     * @param page 
     * @param etpId 企业id
     * @return
     */
    public List<RenterTreaty> getRenterTreaties(Page<RenterTreaty> page,int etpId);
}
