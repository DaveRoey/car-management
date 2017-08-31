package com.controller;

import com.pojo.*;
import com.service.RenterTreatyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/**
 * 租户合约 管理
 *
 * @author Dave
 */
@Controller
@RequestMapping(path = "zuhuheyue")
public class RenterTreatyOfManagerController {

    @Resource
    private RenterTreatyService service;

    /**
     * 获得所的企业
     *
     * @return
     * @author Dave 2017/8/22
     */
    @RequestMapping(path = "getEtps", method = RequestMethod.GET)
    @ResponseBody
    public List<Enterprise> getEnterprises() {
        return service.findAllEnterprise();
    }

    /**
     * 获得所有不重复地址的车位
     *
     * @return
     * @author Dave 2017/8/22
     */
    @RequestMapping(path = "getAddress", method = RequestMethod.GET)
    @ResponseBody
    public List<SystemPort> getCarPortAddress() {
        return service.findCartPortAddress();
    }

    /**
     * 根据车位地址获取所有车位
     *
     * @param portAddress
     * @return
     * @author Dave 2017/8/22
     */
    @RequestMapping(path = "getCar", method = RequestMethod.POST)
    @ResponseBody
    public List<SystemPort> getCarPortByAddress(String portAddress) {
        return service.findCartPortByAddress(portAddress);
    }

    /**
     * 检测合同号是否被注册
     *
     * @param treatyNumber
     * @param pw
     * @author Dave 2017/8/23
     */
    @RequestMapping(path = "/treatyExist", method = RequestMethod.POST)
    public void checkTreatExist(String treatyNumber, PrintWriter pw) {
        boolean isExist = service.checkTreatyExist(treatyNumber);
        if (isExist) {
            pw.write("no");
        } else
            pw.write("ok");
    }

    /**
     * 添加租户合约
     *
     * @param treaty
     * @param pw
     * @author Dave 2017/8/23
     */
    @RequestMapping(path = "addTreaty", method = RequestMethod.POST)
    public void addRenterTreaty(RenterTreaty treaty, PrintWriter pw) {
        service.addRenterTreaty(treaty);
        pw.write("ok");
    }

    /**
     * 添加租赁车位信息
     *
     * @param treatyNumber
     * @param carPorts
     * @author Dave 2017/8/23
     */
    @RequestMapping(path = "addCarts", method = RequestMethod.POST)
    public void addTreatyCarts(String treatyNumber, Integer[] carPorts, PrintWriter pw) {
        service.addTreatyCarts(treatyNumber, carPorts);
        pw.write("ok");
    }

    /**
     * 分页获取数据
     *
     * @param currentPage
     * @param state
     * @param etpName
     * @return
     * @author Dave 2017/8/23
     */
    @RequestMapping(path = "/getList", method = RequestMethod.POST)
    @ResponseBody
    public Page<RenterTreaty> findTreatyByPage(Integer currentPage, Integer state, String etpName) {
        Page<RenterTreaty> page = new Page<>();
        int total = service.getCountByEtpName(etpName, state);
        page.setTotalRecord(total);
        page.setCurrentPage(currentPage);
        List<RenterTreaty> list = service.findRenterTreatyByPage(page, state, etpName);
        page.setList(list);
        return page;
    }


    /**
     * 根据何用id查找
     *
     * @param treatyId
     * @param map
     * @return
     * @author Dave 2017/8/23
     */
    @RequestMapping(path = "getTreaty", method = RequestMethod.POST)
    public String findRentTreatyBy(Integer treatyId, Map<String, RenterTreaty> map) {
        RenterTreaty treaty = service.findRenterTreatyByTreatyId(treatyId);
        System.out.println(treaty.getTreatyId());
        map.put("treaty", treaty);
        return "backstage/zuhuheyue/checkRentTreaty";
    }

    /**
     * 分页查看合同里面的车位
     *
     * @param treatyId
     * @param currentPage
     * @return
     * @author Dave 2017/8/23
     */
    @RequestMapping(path = "getRentCarts", method = RequestMethod.POST)
    @ResponseBody
    public Page<EtpRent> getEtpRentByTreaty(Integer treatyId, Integer currentPage) {
        Page<EtpRent> page = new Page<>();
        int total = service.getTotalCount(treatyId);
        page.setTotalRecord(total);
        page.setCurrentPage(currentPage);
        List<EtpRent> etpRents = service.findEtpRentByTreatyId(treatyId, page);
        page.setList(etpRents);
        return page;
    }

    /**
     * 合同解约
     *
     * @param treatyId
     * @param pw
     * @author Dave 2017/8/23
     */
    @RequestMapping(path = "remove", method = RequestMethod.POST)
    public void removeTreaty(Integer treatyId, PrintWriter pw) {
        RenterTreaty treaty = service.findRenterTreatyByTreatyId(treatyId);
        boolean isSuccess = service.removeTreatyAndModifyCarState(treaty);
        pw.write(isSuccess ? "ok" : "no");

    }
}
