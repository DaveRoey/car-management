package com.controller;

import java.io.File;
import java.io.FileReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.CarPort;
import com.pojo.Letter;
import com.pojo.Page;
import com.service.LetterOfManagerService;

/**
 * 后台管理包租婆（杨光）
 *
 * @author Administrator
 */
@Controller
public class LetterOfManagerController {
    @Resource
    private LetterOfManagerService letterOfManagerService;

    /**
     * 显示letter列表
     *
     * @param stateSelect 模糊查询条件（分装到letter中）
     * @param currentPage （当前页信息）
     * @return
     */
    @RequestMapping(path = "/LetterOfManager/showLetters", method = RequestMethod.POST)
    public @ResponseBody
    Page<Letter> showLetters(String stateSelect, String letterName, Integer currentPage) {

        //从前台获取当前页和模糊查询的条件

        System.out.println(stateSelect + " " + letterName + " " + currentPage);

        //设置letter(stateSelect、letterName)
        Letter letter = new Letter();
        //如果stateSelect=4，则表示查询全部,否则
        if (!"4".equals(stateSelect)) {
            letter.setState(Integer.parseInt(stateSelect));

        } else {
            letter.setState(4);
        }
        //对姓名进行处理
        if ("".equals(letterName)) {
            letter.setUserName("");

        } else {
            letter.setUserName(letterName);
        }
        //根据letter条件查询总记录数
        Page<Letter> page = new Page<>();
        page.setTotalRecord(letterOfManagerService.getCountOfLetter(letter));
        //设置page
        page.setCurrentPage(currentPage);


        List<Letter> list = new ArrayList<>();
        list.add(letter);

        page.setList(list);

        list = letterOfManagerService.findLetterByStateAndUserNameLike(page);


        page.setList(list);

        return page;

    }


    /**
     * 审核车位列表界面
     *
     * @param currentPage
     * @return
     */
    @RequestMapping(path = "/LetterOfManager/showCarPorts", method = RequestMethod.POST)
    public @ResponseBody
    Page<CarPort> showCarPort(int currentPage, HttpServletRequest request) {
        Page<CarPort> page = new Page<>();
        page.setPageSize(3);
        page.setTotalRecord(letterOfManagerService.getCarPortCount(0));
        page.setCurrentPage(currentPage);
        System.out.println("当前页+   "+currentPage);


        List<CarPort> list = letterOfManagerService.getCarPortOfState(page);

        //对图片真实性进行验证
        for (CarPort carPort : list) {
            //得到项目根路径
            String realPath = request.getServletContext().getRealPath("/");

            String subPath = carPort.getPropImage();

            String path = realPath + subPath;

            File file = new File(path);

            if (!file.exists()) {
                carPort.setPropImage("upload/Property/noimage.png");
            }

        }
        page.setList(list);
        return page;

    }

    ;

    @RequestMapping(path = "/LetterOfManager/shenHeCarPort", method = RequestMethod.POST)
    public void shenHeCarPort(int carPortId,PrintWriter pw) {
        System.out.println(carPortId);
        letterOfManagerService.shenHeCarPort(carPortId);
        pw.write("1");

    }

    /**
     * 单个审核
     *
     * @param letterId
     */
    @RequestMapping(path = "/LetterOfManager/shenHeLetter")
    public void shenHeLetter(int letterId) {

        System.out.println(letterId);
        List<Integer> letterIds = new ArrayList<>();
        letterIds.add(letterId);
        letterOfManagerService.shenHe(letterIds);
    }

    /**
     * 批量审核
     *
     * @param list
     */
    @RequestMapping(path = "/LetterOfManager/shenHeLetters", method = RequestMethod.POST)
    public void shenHeLetters(@RequestBody List<Integer> list) {


        letterOfManagerService.shenHe(list);
    }

    /**
     * 单个删除
     *
     * @param
     */
    @RequestMapping(path = "/LetterOfManager/delLetter", method = RequestMethod.POST)
    public void delLetters(Integer letterId) {


        System.out.println(letterId);
        List<Integer> list = new ArrayList<>();
        list.add(letterId);


        letterOfManagerService.delLetters(list);
        ;
        System.out.println("删除成功");
    }

    /**
     * 批量删除
     *
     * @param list
     */
    @RequestMapping(path = "/LetterOfManager/delLetters", method = RequestMethod.POST)
    public void delLetters(@RequestBody List<Integer> list) {

        System.out.println(list);


        letterOfManagerService.delLetters(list);
        ;
    }

    /**
     * 得到待审核的包租婆数量
     *
     * @param pw
     * @author Dave
     */
    @RequestMapping(path = "/LetterOfManager/getLetterCount", method = RequestMethod.GET)
    public void getLetterNoPermissionCount(PrintWriter pw) {
        int count = letterOfManagerService.countLetterByState();
        pw.write(count + "");
    }

    /**
     * 得到待审核的车辆数
     *
     * @param pw
     * @author Dave
     */
    @RequestMapping(path = "/LetterOfManager/getCarCount", method = RequestMethod.GET)
    public void getCarNoPermissionCount(PrintWriter pw) {
        int count = letterOfManagerService.getCarPortCount(0);
        pw.write("" + count);
    }


}
