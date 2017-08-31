package com.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Page;
import com.pojo.SystemPort;
import com.service.SystemPortService;

/**
 * 后台车位管理
 *
 * @author Administrator
 */
@Controller
@RequestMapping(path = "cheweiguanli")
public class CarportOfManagerController {
    @Resource(name = "systemPortServiceImpl")
    private SystemPortService systemPortService;

    @RequestMapping(path = "carPortManage", method = RequestMethod.POST)
    public @ResponseBody
    Page<SystemPort> carPortManage(int currentPage) {

        Page page = systemPortService.findTheSystemPorts(currentPage);
        return page;
    }

    @RequestMapping(path = "findpageNum")
    public void findpageNum(PrintWriter out) {
        long theNum = systemPortService.findTheNumberOfSystemPort();

        int number = (int) theNum;

        double pageSize = Math.floor(number / 4) + 1;

        Double theOne = new Double(pageSize);
        String output = theOne.toString();
        out.write(output);
    }

    @RequestMapping(path = "add", method = RequestMethod.POST)
    public String addCarPort(SystemPort port, PrintWriter out) {
        System.out.println(port.getPortNumber());
        System.out.println(port.getPortAdress());
        systemPortService.addSystemPort(port);
        return "redirect:/backstage/cheweiguanli/manageCarPort.jsp";
    }

    @RequestMapping(path = "getList", method = RequestMethod.POST)
    public @ResponseBody
    Page<SystemPort> findByCondition(int state, String address, Integer currentPage) {
        Page<SystemPort> page = systemPortService.findSystemPortsByInfos(state, address, currentPage);
        return page;
    }

    @RequestMapping(path = "groupAdd", method = RequestMethod.POST)
    public void groupAdd(@RequestBody List<String> array1, PrintWriter pw) {
        for (int i = 0; i < array1.size(); i++) {
            String source = array1.get(i);
            System.out.println(source);
            String[] result = source.split(",");
            SystemPort port = new SystemPort();
            int number = Integer.parseInt(result[1]);

            for (int j = 0; j < number; j++) {
                String portN = result[0] + j + "";
                port.setPortNumber(portN);
                port.setPortAdress(result[2]);
                port.setPortState(0);
                systemPortService.addSystemPort(port);
            }

        }
        pw.write("ok");


    }

    @RequestMapping(path = "checkExistPorts", method = RequestMethod.POST)
    public void checkExistPorts(String address, String portNum, PrintWriter out) {

        List<SystemPort> list = systemPortService.findPortsByPortAddressAndPortNumber(address, portNum);
        if (list.iterator().hasNext()) {
            out.write("exist");
        } else {
            out.write("DNE");

        }
    }
}
