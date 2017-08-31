package com.service;

import com.pojo.Page;

public interface RenterComplainManagerService {

    /**
     * 强租客投诉分页
     *
     * @param currentPage
     * @param optionState
     * @return
     */
    Page getRenterComplainsByComState(String currentPage, int optionState);

    /**
     * 强租客操作
     *
     * @param optionSta
     * @param clickId
     */
    void renterOption(int optionSta, int clickId);

    /**
     * 得到强租客待审核投诉数量
     *
     * @return
     * @author Dave 2017/8/23
     */
    int getRenterAuditCount();

}
