package com.service;

import com.pojo.Page;

public interface LetterComplainManagerService {

    /**
     * 获得包租婆投诉页
     *
     * @param currentPage
     * @param optionState
     * @return
     */
    Page getLetterComplainsByComState(String currentPage, String optionState);

    /**
     * 包租婆操作
     *
     * @param num
     * @param clickId
     */
    void letterOption(int num, int clickId);

    /**
     * 得到待审核包租婆投诉订单
     *
     * @return
     */
    int getLAuditLetterCount();
}
