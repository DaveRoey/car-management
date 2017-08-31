package com.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Manage;
import com.service.InforOfManageService;
import com.service.impl.InforOfManageServiceImpl;

/**
 * 后台企业信息管理（杨光）
 *
 * @author Administrator
 */
@Controller
@RequestMapping(path = "/xinxiguanli")
public class InforOfManagerController {
    @Resource(name = "inforOfManageServiceImpl")
    private InforOfManageService inforOfManageService;

    /**
     * 查看个人信息
     */
    @RequestMapping(path = "checkInfo", method = RequestMethod.POST)
    public @ResponseBody
    Manage findEmpIdAndPasswordAndphone(int empId) {

        return inforOfManageService.findEmpIdAndPasswordAndPhone(empId);
    }

    /**
     * 判断密码
     */
    @RequestMapping(path = "updateInfo", method = RequestMethod.POST)
    public @ResponseBody
    int findEmpIdAndPassword(int empId, String userPwd, String usernewPwd,
                             String userphone,HttpSession session) {

        String password = DigestUtils.md5Hex(userPwd);//原密码
        String newPwd = DigestUtils.md5Hex(usernewPwd);//新密码

        Manage manage = inforOfManageService.findEmpIdAndPassword(empId,
                password);

        if (manage != null) {
            if (userphone != "") {
                manage.setPhone(userphone);
                manage.setPassword(newPwd);
            } else {
                manage.setPassword(newPwd);
            }
            inforOfManageService.updateManege(manage);
            session.setAttribute("manage", manage);
            return 1;
        }
        return 0;
    }

    // 登录判断是否存在
    @RequestMapping(path = "managerLogin", method = RequestMethod.POST)
    public void login(String empId, String password, HttpSession session,
                      PrintWriter out) {
        int id;
        try {
            id = Integer.parseInt(empId);
            String newPwd = DigestUtils.md5Hex(password);//新密码
            Manage manage = inforOfManageService.findEmpIdAndPassword(id,
                    newPwd);
            if (manage == null) {
                out.write("no");
            } else {
                session.setAttribute("manage", manage);
                out.write("ok");
            }
        } catch (Exception e) {
            out.write("no");
        }


    }

    @RequestMapping(path = "clearsession", method = RequestMethod.GET)
    public String clearsession(HttpSession session) {
        if (session != null) {
            session.removeAttribute("manage");
        }
        return "redirect:../backstage/login.html";
    }
}
