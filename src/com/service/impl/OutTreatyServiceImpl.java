package com.service.impl;

import com.dao.OutTreatyDao;
import com.dao.RenewTreatyDao;
import com.dao.RenterTreatyDao;
import com.pojo.OutTreaty;
import com.pojo.Page;
import com.pojo.Renewtreaty;
import com.service.OutTreatyService;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Dave on 2017/8/24
 * Describes
 */
@Service
public class OutTreatyServiceImpl implements OutTreatyService {

    @Resource
    private OutTreatyDao dao;
    @Resource
    private RenewTreatyDao newTreatyDao;

    /**
     * 添加外部合约
     *
     * @param outTreaty
     * @author Dave 2017/8/23
     */
    @Override
    public void addOutTreaty(OutTreaty outTreaty) {
        dao.save(outTreaty);
    }

    /**
     * 检测合同是否被注册
     *
     * @param treatyNumber
     * @return
     */
    @Override
    public OutTreaty findTreatyByTreatyNumber(String treatyNumber) {
        return dao.findOutTreatyByTreatyNumber(treatyNumber);
    }

    /**
     * 根据条件获取总记录数
     *
     * @param treatyState
     * @param companyName
     * @return
     */
    @Override
    public int getTotalByCondition(Integer treatyState, String companyName) {
        return dao.countByTreatyStateAndCompanyLike(treatyState, "%" + companyName + "%");
    }

    /**
     * 分页获取数据
     *
     * @param treatyState
     * @param companyName
     * @param page
     * @return
     */
    @Override
    public List<OutTreaty> findTreatyByPage(Integer treatyState, String companyName, Page page) {
        PageRequest request = new PageRequest(page.getCurrentPage() - 1, page.getPageSize());
        return dao.findOutTreatyByTreatyStateAndCompanyLike(treatyState, "%" + companyName + "%", request);
    }

    /**
     * 根据合同id查找到合同
     *
     * @param treatyId
     * @return
     */
    @Override
    public OutTreaty findTreatyByTreatyId(Integer treatyId) {
        return dao.findOne(treatyId);
    }

    /**
     * 解除合约
     *
     * @param treatyId
     * @return
     */
    @Override
    public boolean modifyTreatyState(Integer treatyId) {
        OutTreaty treaty = findTreatyByTreatyId(treatyId);
        boolean isSuccess = true;
        if (treaty == null) {
            isSuccess = false;
        } else {
            treaty.setTreatyState(2);//解约状态
            try {
                dao.save(treaty);
            } catch (Exception e) {
                isSuccess = false;
            }
        }
        return isSuccess;
    }

    /**
     * 续约外部合同
     *
     * @param renewtreaty
     */
    @Override
    public void addNewTreaty(Renewtreaty renewtreaty) {

        OutTreaty outtreaty = findTreatyByTreatyId(renewtreaty.getTreaty().getTreatyId());
        outtreaty.setTreatyState(1);//设置状态为续约
        dao.save(outtreaty);
        newTreatyDao.save(renewtreaty);//保存续约合同
    }

    /**
     * 得到续约的合同
     *
     * @param treatyId
     * @return
     */
    @Override
    public Renewtreaty findNewTreaty(int treatyId) {
        return newTreatyDao.findRenewtreatyByTreatyTreatyId(treatyId);
    }
}
