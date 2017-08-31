package com.service.impl;

import com.dao.EtpRentDao;
import com.pojo.EtpRent;
import com.pojo.Page;
import com.service.EtpRentService;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Dave on 2017/8/23
 * Describes 企业租赁service实现接口
 */
@Service
public class EtpRentServiceImpl implements EtpRentService {

    @Resource
    private EtpRentDao dao;

    /**
     * 添加租赁车位
     *
     * @param etpRents
     * @author Dave 2017/8/23
     */

    @Override
    public void addEtpRent(List<EtpRent> etpRents) {
        dao.save(etpRents);
    }

    /**
     * 根据合同id查找车位
     *
     * @param treatyId
     * @return
     * @author Dave 2017/8/23
     */
    @Override
    public List<EtpRent> findEtpRentByTreatyId(Integer treatyId, Page page) {
        PageRequest request = new PageRequest(page.getCurrentPage() - 1, page.getPageSize());
        return dao.findEtpRentsByRenterTreatyTreatyId(treatyId, request);
    }

    /**
     * 根据合同id得到合同内的车位数量
     *
     * @param treatyId
     * @return
     * @author Dave 2017/8/23
     */
    @Override
    public int getTotalCount(Integer treatyId) {
        return dao.countByRenterTreatyTreatyId(treatyId);
    }

    /**
     * 根据合同号 得到所用的租赁信息
     *
     * @param treatyId
     * @return
     * @author Dave 2017/8/24
     */
    @Override
    public List<EtpRent> findEtpRentByTreatyId(Integer treatyId) {
        return dao.findEtpRentsByRenterTreatyTreatyId(treatyId);
    }

    /**
     * 删除租赁信息
     * @param etpRent
     */
    @Override
    public void removeEtpRent(EtpRent etpRent) {
        dao.delete(etpRent);
    }
}
