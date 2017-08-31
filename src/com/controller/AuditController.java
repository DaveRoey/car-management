package com.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.CarPort;
import com.pojo.Page;
import com.service.CarPortService;

@Controller
public class AuditController {

    @Resource
    private CarPortService carportservice;

    @RequestMapping(path = "showCarPort.do")
    public @ResponseBody
    Page<CarPort> showCarPort(int currentPage, String location) {
        Page<CarPort> page = new Page<CarPort>();
        if (location == null) {
            location = "";
        }

        page.setTotalRecord(carportservice.getTotalCount(0));
        page.setCurrentPage(currentPage);

        location = "%" + location + "%";

        System.out.println(location);

        page.setList(carportservice.getPage(page, location, 0));

        System.out.println(page.getList().size());

        return page;
    }

    @RequestMapping(path = "audit.do")
    public void auditOption(int portId, PrintWriter out) {
        carportservice.auditCarPort(portId);
        System.out.println(portId);
        out.write("1");

    }
}
