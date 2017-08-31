package com.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.LetterComplain;
import com.pojo.Page;
import com.pojo.RenterComplain;
import com.service.LetterComplainManagerService;
import com.service.LetterComplainService;
import com.service.RenterComplainManagerService;
import com.service.RenterComplainService;

/**
 * 后台投诉管理
 *
 * @author Administrator
 */
@Controller
@RequestMapping(path = "tousuguanli")
public class ConplainOfManagerController {
    @Resource
    private LetterComplainManagerService letterComplainManagerService;
    @Resource
    private RenterComplainManagerService renterComplainManagerService;

    /**
     * 显示包租婆投诉页
     *
     * @param currentPage
     * @param optionState
     * @param request
     * @return
     */
    @RequestMapping(path = "letterComplain.do", method = RequestMethod.GET)
    public @ResponseBody
    Page<LetterComplain> letterComplain(String currentPage, String optionState, HttpServletRequest request) {


        Page page = letterComplainManagerService.getLetterComplainsByComState(currentPage, optionState);

        return page;

    }

    /**
     * 强租客投诉页
     *
     * @param currentPage
     * @param optionState
     * @param request
     * @return
     */
    @RequestMapping(path = "renterComplain.do", method = RequestMethod.GET)
    public @ResponseBody
    Page<RenterComplain> renterComplain(String currentPage, int optionState, HttpServletRequest request) {

        System.out.println("强租客" + currentPage + optionState);
        Page page = renterComplainManagerService.getRenterComplainsByComState(currentPage, optionState);

        return page;

    }

    /**
     * 强租客操作
     */
    @RequestMapping(path = "renterComplainOption.do", method = RequestMethod.GET)
    public void renterComplainOption(String optionSta, int clickId) {
        int num = 0;
        try {
            optionSta = new String(optionSta.getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        System.out.println(optionSta + optionSta + optionSta + optionSta);

        if ("受理".equals(optionSta.trim())) {
            num = 1;

        } else if ("无效".equals(optionSta.trim())) {
            num = 2;
        } else {
            num = 3;
        }
        System.out.println("renter op操作" + optionSta + num);
        renterComplainManagerService.renterOption(num, clickId);

    }

    /**
     * 包租婆操作
     */
    @RequestMapping(path = "letterComplainOption.do", method = RequestMethod.GET)
    public void letterComplainOption(String optionSta, int clickId) {
        int num = 0;
        try {
            optionSta = new String(optionSta.getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        System.out.println(optionSta + optionSta + optionSta + optionSta);

        if ("受理".equals(optionSta.trim())) {
            num = 1;

        } else if ("无效".equals(optionSta.trim())) {
            num = 2;
        } else {
            num = 3;
        }
        System.out.println("letter op操作" + optionSta + num);
        letterComplainManagerService.letterOption(num, clickId);

    }


    /**
     * 得到包租婆投诉待审核数量
     *
     * @param pw
     * @author Dave
     */
    @RequestMapping(path = "getLetterCount", method = RequestMethod.GET)
    public void getLetterCount(PrintWriter pw) {
        int count = letterComplainManagerService.getLAuditLetterCount();
        pw.write("" + count);
    }

    /**
     * 得到强租客投诉待审核数量
     *
     * @param pw
     * @author Dave
     */
    @RequestMapping(path = "getRenterCount", method = RequestMethod.GET)
    public void getRenterCount(PrintWriter pw) {
        int count = renterComplainManagerService.getRenterAuditCount();
        pw.write("" + count);
    }

}
