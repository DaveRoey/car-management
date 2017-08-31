package com.service;

import java.util.List;

import com.pojo.CarPort;
import com.pojo.Letter;
import com.pojo.Page;

/**
 * 后台包租婆管理（杨光）
 *
 * @author Administrator
 */
public interface LetterOfManagerService {

    /**
     * 根据状态和姓名查询letter
     *
     * @param page letter类中封装（state和userName）
     * @return
     */
    public List<Letter> findLetterByStateAndUserNameLike(Page<Letter> page);

    /**
     * 根据状态和姓名查询letter的总记录数
     *
     * @param letter
     * @return
     */
    public int getCountOfLetter(Letter letter);

    /**
     * 批量审核
     *
     * @param letterIds （letter的id集合）
     */
    public void shenHe(List<Integer> letterIds);

    /**
     * 批量删除
     *
     * @param letterIds （letter的id集合）
     */
    public void delLetters(List<Integer> letterIds);

    /**
     * 得到需要审核的车位信息
     *
     * @return
     */
    public List<CarPort> getCarPortOfState(Page<CarPort> page);

    /**
     * 得到需要审核的车位数量
     *
     * @param state
     * @return
     */
    public int getCarPortCount(int state);

    /**
     * 审核车位（单）
     *
     * @param carPortId
     */
    public void shenHeCarPort(int carPortId);


    /**
     * 根据状态得打待审核数量
     * @author Dave
     * @return
     */
    int countLetterByState();
}
