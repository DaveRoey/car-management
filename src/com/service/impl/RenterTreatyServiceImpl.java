package com.service.impl;

import com.dao.EnterpriseDao;
import com.dao.RenterTreatyDao;
import com.dao.SystemPortDao;
import com.mapper.RenterTreatyMapper;
import com.pojo.*;
import com.service.EtpRentService;
import com.service.RenterTreatyService;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by Dave on 2017/8/22
 * Describes 租户合约service实现类
 */
@Service
public class RenterTreatyServiceImpl implements RenterTreatyService {


    @Resource
    private RenterTreatyDao dao;
    @Resource
    private RenterTreatyMapper mapper;
    @Resource
    private EnterpriseDao enterpriseDao;
    @Resource
    private SystemPortDao systemPortDao;
    @Resource
    private EtpRentService service;


    /**
     * 根据合同id查找合同
     *
     * @param treatyId
     * @return
     * @author Dave 2017/8/23
     */
    @Override
    public RenterTreaty findRenterTreatyByTreatyId(int treatyId) {
        return dao.findRenterTreatyByTreatyId(treatyId);
    }

    @Override
    public List<RenterTreaty> findRenterTreatiesByEnterprise(Enterprise enterprise) {
        
    	
    	return dao.findRenterTreatiesByEnterpriseEtpId(enterprise.getEtpId());
    }

    /**
     * 保存租户合约
     *
     * @param treaty
     * @author Dave 2017/8/23
     */
    @Override
    public void addRenterTreaty(RenterTreaty treaty) {
        dao.save(treaty);
    }

    @Override
    public boolean removeRenterTreaty(int treatyId) {
        return mapper.deleteRenterTreaty(treatyId) > 0;
    }

    @Override
    public boolean modifyRenterTreaty(RenterTreaty treaty) {
        return false;
    }

    /**
     * 获得所有的企业
     *
     * @return
     * @author Dave 2017/8/22
     */
    @Override
    public List<Enterprise> findAllEnterprise() {
        return enterpriseDao.findAll();
    }

    /**
     * 获得地址不重复的车位
     *
     * @return
     * @author Dave 2017/8/22
     */
    @Override
    public List<SystemPort> findCartPortAddress() {
        return systemPortDao.findDistinctAddress();
    }

    /**
     * 根据车位地址获取车位信息
     *
     * @param portAddress
     * @return
     * @author Dave 2017/8/22
     */
    @Override
    public List<SystemPort> findCartPortByAddress(String portAddress) {
        return systemPortDao.findSystemPortsByPortAdress(portAddress);
    }

    /**
     * 检测合同号是否被注册
     *
     * @param treatyNumber
     * @return
     * @author Dave 2017/8/23
     */
    @Override
    public boolean checkTreatyExist(String treatyNumber) {
        return dao.countRenterTreatyByTreatyNumber(treatyNumber) > 0;
    }

    /**
     * 保存合同的车位
     *
     * @param treatyNumber
     * @param carPorts
     */
    @Override
    public void addTreatyCarts(String treatyNumber, Integer[] carPorts) {
        //得到合同
        RenterTreaty treaty = dao.findRenterTreatyByTreatyNumber(treatyNumber);
        //得到车位
        List<SystemPort> ports = systemPortDao.findAll(Arrays.asList(carPorts));
        //构建批量添加列表
        List<EtpRent> etpRents = new ArrayList<>();

        for (int i = 0; i < ports.size(); i++) {
            //设置租赁信息
            EtpRent etpRent = new EtpRent();
            SystemPort port = ports.get(i);
            etpRent.setPort(port);
            etpRent.setRenterTreaty(treaty);
            etpRents.add(etpRent);
            //修改车位状态
            port.setPortState(1);
            systemPortDao.save(port);
        }
        service.addEtpRent(etpRents);//添加
    }

    /**
     * 分页获取数据
     *
     * @param page
     * @param state
     * @param etpName
     * @return
     * @author Dave 2017/8/23
     */
    @Override
    public List<RenterTreaty> findRenterTreatyByPage(Page<RenterTreaty> page, Integer state, String etpName) {
        PageRequest request = new PageRequest(page.getCurrentPage() - 1, page.getPageSize());
        return dao.findRenterTreatiesByTreatyStateAndEnterpriseEtpNameLike(state, "%" + etpName + "%", request);
    }

    /**
     * 根据条件获取总共记录数据
     *
     * @param etpName
     * @param state
     * @return
     * @author Dave 2017/8/23
     */
    @Override
    public int getCountByEtpName(String etpName, Integer state) {
        return dao.countRenterTreatyByTreatyStateAndEnterpriseEtpNameLike(state, "%" + etpName + "%");
    }

    /**
     * 根据合同id分页查找车位
     *
     * @param treatyId
     * @param page
     * @return
     * @author Dave 2017/8/23
     */
    @Override
    public List<EtpRent> findEtpRentByTreatyId(Integer treatyId, Page page) {
        return service.findEtpRentByTreatyId(treatyId, page);
    }

    /**
     * 根据合同id分页查找车位
     *
     * @param treatyId
     * @return
     * @author Dave 2017/8/23
     */
    @Override
    public int getTotalCount(Integer treatyId) {
        return service.getTotalCount(treatyId);
    }

    /**
     * 根据合同id得到所用的车位租赁信息
     *
     * @param treatyId
     * @return
     * @author Dave 2017/8/23
     */
    @Override
    public List<EtpRent> findEtpRentByTreatyId(Integer treatyId) {
        return service.findEtpRentByTreatyId(treatyId);
    }

    /**
     * 删除合同 与修改合同内的车位状态
     *
     * @param treaty
     * @return
     */
    @Override
    public boolean removeTreatyAndModifyCarState(RenterTreaty treaty) {
        List<EtpRent> etpRents = findEtpRentByTreatyId(treaty.getTreatyId());
        for (EtpRent etpRent : etpRents) {
            //修改车位状态
            SystemPort port = etpRent.getPort();
            port.setPortState(0);
            systemPortDao.save(port);
            //删除租赁信息
            service.removeEtpRent(etpRent);
        }
        //删除合同
        return removeRenterTreaty(treaty.getTreatyId());
    }

	@Override
	public List<RenterTreaty> getRenterTreaties(Page<RenterTreaty> page,int etpId) {
		// TODO Auto-generated method stub
		Pageable pageable= new PageRequest(page.getCurrentPage()-1, page.getPageSize());
		List<RenterTreaty> list=dao.findRenterTreatiesByEnterpriseEtpId(etpId, pageable);
		return list;
	}

}
