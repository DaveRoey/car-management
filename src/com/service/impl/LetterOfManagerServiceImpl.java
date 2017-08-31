package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.dao.CarPortDao;
import com.dao.LetterDao;
import com.dao.LetterOfManagerDao;
import com.pojo.CarPort;
import com.pojo.Letter;
import com.pojo.Page;
import com.service.LetterOfManagerService;

@Service
public class LetterOfManagerServiceImpl implements LetterOfManagerService {

    @Resource
    private LetterOfManagerDao letterOfManagerDao;

    @Resource
    private CarPortDao carPortDao;

    @Override
    public List<Letter> findLetterByStateAndUserNameLike(Page<Letter> page) {
        // TODO Auto-generated method stub
        System.out.println("总记录+ " + page.getTotalRecord() + " " + page.getCurrentPage());
        Pageable pageable = new PageRequest(page.getCurrentPage() - 1, page.getPageSize());
        ;
        //从page中读取letter中的state和userName   (4表示查询全部)
        List<Letter> list = null;
        if (page.getList().get(0).getState() == 4) {
            list = letterOfManagerDao.findLetterByUserNameLike(pageable, "%" + page.getList().get(0).getUserName() + "%");
        } else {
            list = letterOfManagerDao.findLetterByStateAndUserNameLike(pageable, page.getList().get(0).getState(), "%" + page.getList().get(0).getUserName() + "%");
        }

        System.out.println(list.size());

        return list;
    }

    @Override
    public void shenHe(List<Integer> letterIds) {

        //先查出从需要审核的letter的详细数据

        List<Letter> list = new ArrayList<>();

        for (Integer letterId : letterIds) {
            list.add(letterOfManagerDao.findLetterByLetterIdAndState(letterId, 0));
        }

        //审核的标准？暂时全部通过
        if (true) {
            for (Letter letter : list) {
                letter.setState(1);
                letterOfManagerDao.saveAndFlush(letter);

            }

        }
    }

    @Override
    public List<CarPort> getCarPortOfState(Page<CarPort> page) {
        // TODO Auto-generated method stub
        System.out.println("当前页 " + page.getCurrentPage());
        Pageable pageable = new PageRequest(page.getCurrentPage() - 1, page.getPageSize());
        ;
        return carPortDao.findCarPortByPortState(0, pageable);
    }

    @Override
    public void shenHeCarPort(int carPortId) {
        // TODO Auto-generated method stub
        //先找出该车详情
        CarPort carPort = carPortDao.findOne(carPortId);

        //审核通过条件?暂且全部通过，审核通过后carport中的portstate改变为1
        if (true) {
            carPort.setPortState(1);
            carPortDao.saveAndFlush(carPort);
            System.out.println("成功");

        }
    }

    /**
     * 根据状态查找包租婆
     *
     * @return
     * @author Dave 2017/2/26
     */
    @Override
    public int countLetterByState() {
        return letterOfManagerDao.countByState(0);
    }

    @Override
    public int getCountOfLetter(Letter letter) {
        // TODO Auto-generated method stub
        int i = 0;
        if (letter.getState() == 4) {
            //查询全部
            i = letterOfManagerDao.countByUserNameLike("%" + letter.getUserName() + "%");
        } else {
            //根据不同的状态来查询
            i = letterOfManagerDao.countByStateAndUserNameLike(letter.getState(), "%" + letter.getUserName() + "%");
        }
        return i;
    }

    @Override
    public int getCarPortCount(int state) {
        // TODO Auto-generated method stub
        //0表示未审核

        return carPortDao.countByPortState(0);
    }

    @Override
    public void delLetters(List<Integer> letterIds) {
        // TODO Auto-generated method stub
        //先查出从需要删除的letter的详细数据

        for (Integer integer : letterIds) {

            letterOfManagerDao.delete(integer);
        }

        //

    }

}
