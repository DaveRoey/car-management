package com.dao;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;


import com.pojo.Letter;

/**
 * 后台包租婆管理（杨光）
 *
 * @author Administrator
 */

public interface LetterOfManagerDao extends JpaRepository<Letter, Integer> {
    /**
     * 根据状态和姓名查询letter
     *
     * @param pageable
     * @param state    状态（显示类别：已审核、未审核、全部）0表示未审核(注册时默认) 1表示通过审核 2表示被禁用
     * @param userName 姓名
     * @return
     */
    public List<Letter> findLetterByStateAndUserNameLike(Pageable pageable, int state, String userName);

    /**
     * 根据id和状态来查询letter
     *
     * @param letterId 用户id
     * @param state    状态
     * @return
     */
    public Letter findLetterByLetterIdAndState(int letterId, int state);

    /**
     * 根据姓名来模糊查询
     *
     * @param pageable
     * @param userName
     * @return
     */
    public List<Letter> findLetterByUserNameLike(Pageable pageable, String userName);

    /**
     * 根据状态和姓名来查询记录数
     *
     * @param state
     * @param userName
     * @return
     */
    public int countByStateAndUserNameLike(int state, String userName);

    /**
     * 根据姓名来查询记录数
     *
     * @param userName
     * @return
     */
    public int countByUserNameLike(String userName);

    /**
     * 根据状态统计个数
     *
     * @param state
     * @return
     * @auhtor Dave 2017/2/26
     */
    int countByState(int state);
}
