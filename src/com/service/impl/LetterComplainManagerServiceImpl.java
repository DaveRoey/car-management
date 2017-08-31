package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.dao.LetterComplainManagerDao;
import com.mapper.LetterComplainManagerMapper;
import com.pojo.LetterComplain;
import com.pojo.Page;
import com.pojo.RenterComplain;
import com.service.LetterComplainManagerService;

@Service
public class LetterComplainManagerServiceImpl implements
        LetterComplainManagerService {

    @Resource
    private LetterComplainManagerDao letterComplainManagerDao;
    @Resource
    private LetterComplainManagerMapper letterComplainManagerMapper;

    @Override
    public Page getLetterComplainsByComState(String currentPage,
                                             String optionState) {
        int state = 0;
        int current = Integer.parseInt(currentPage);

        switch (optionState) {
            case "所有状态":
                state = 4;
                break;
            case "已受理":
                state = 1;
                break;
            case "无效":
                state = 2;
                break;
            case "暂缓":
                state = 3;
                break;
            case "未受理":
                state = 0;
                break;
        }
        Page page = new Page();
        if (state == 4) {
            page.setTotalRecord(getTotalCount());
            page.setCurrentPage(current);
            Pageable pageable = new PageRequest(page.getCurrentPage() - 1, page.getPageSize());
            List<LetterComplain> list = letterComplainManagerDao.findAll(pageable).getContent();
            page.setList(list);
        } else {
            page.setTotalRecord(gettotalCountByComState(state));
            page.setCurrentPage(current);
            Pageable pageable = new PageRequest(page.getCurrentPage() - 1, page.getPageSize());
            List<LetterComplain> list = letterComplainManagerDao.findLetterComplainsByComState(state, pageable);
            page.setList(list);
        }


        return page;
    }

    /**
     * 获得包租婆总记录数
     *
     * @return
     */
    private int getTotalCount() {
        int total = letterComplainManagerDao.countByComState(0);
        total += letterComplainManagerDao.countByComState(1);
        total += letterComplainManagerDao.countByComState(2);
        total += letterComplainManagerDao.countByComState(3);
        return total;
    }

    /**
     * 根据状态的总记录数
     *
     * @param state
     * @return
     */
    private int gettotalCountByComState(int state) {
        int total = letterComplainManagerDao.countByComState(state);
        return total;
    }

    @Override
    public void letterOption(int num, int clickId) {
        LetterComplain letterComplain = letterComplainManagerDao.findOne(clickId);
        letterComplain.setComState(num);
        letterComplainManagerMapper.updateLetter(letterComplain);
    }

    /**
     * 得到待审核包租婆投诉数量
     *
     * @return
     * @author Dave 2017/8/23
     */
    @Override
    public int getLAuditLetterCount() {
        return letterComplainManagerDao.countByComState(0);
    }


}
