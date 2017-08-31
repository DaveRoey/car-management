package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.dao.RenterComplainManagerDao;
import com.mapper.RenterComplainManagerMapper;
import com.pojo.LetterComplain;
import com.pojo.Page;
import com.pojo.RenterComplain;
import com.service.RenterComplainManagerService;

@Service
public class RenterComplainManagerServiceImpl implements
        RenterComplainManagerService {

    @Resource
    private RenterComplainManagerDao renterComplainManagerDao;
    @Resource
    private RenterComplainManagerMapper renterComplainManagerMapper;

    @Override
    public Page getRenterComplainsByComState(String currentPage,
                                             int optionState) {
        int current = Integer.parseInt(currentPage);
        Page<RenterComplain> page = new Page<RenterComplain>();

        System.out.println("serviceserviceserviceserviceserviceserviceserviceservice" + current);

        if (optionState == 4) {//显示所有状态
            page.setTotalRecord(getTotalCount());
            page.setCurrentPage(current);
            Pageable pageable = new PageRequest(page.getCurrentPage() - 1, page.getPageSize());
            List<RenterComplain> list = renterComplainManagerDao.findAll(pageable).getContent();
            page.setList(list);
        } else {
            page.setTotalRecord(getTotalCountByComState(optionState));
            page.setCurrentPage(current);
            Pageable pageable = new PageRequest(page.getCurrentPage() - 1, page.getPageSize());
            List<RenterComplain> list = renterComplainManagerDao.findRenterComplainsByComState(optionState, pageable);
            page.setList(list);
        }
        return page;
    }

    /**
     * 获得总记录数
     *
     * @return
     */
    private int getTotalCount() {
        int total = renterComplainManagerDao.countByComState(0);
        total += renterComplainManagerDao.countByComState(1);
        total += renterComplainManagerDao.countByComState(2);
        total += renterComplainManagerDao.countByComState(3);

        return total;
    }

    private int getTotalCountByComState(int comState) {

        int total = renterComplainManagerDao.countByComState(comState);
        return total;
    }

    @Override
    public void renterOption(int optionSta, int clickId) {
        RenterComplain renterComplain = renterComplainManagerDao.findOne(clickId);
        renterComplain.setComState(optionSta);
        renterComplainManagerMapper.updateRenter(renterComplain);
    }

    /**
     * 得到强租客投诉待审核数量
     *
     * @return
     * @author Dave 2018/8/23
     */
    @Override
    public int getRenterAuditCount() {
        return renterComplainManagerDao.countByComState(0);
    }

}
