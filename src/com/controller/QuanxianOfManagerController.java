package com.controller;

import com.pojo.Manage;
import com.pojo.Page;
import com.service.ManagerService;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/**
 * 后台权限管理
 *
 * @author Dave
 */
@Controller
@RequestMapping(path = "quanxianguanli")
public class QuanxianOfManagerController {

    @Resource
    private ManagerService service;

    /**
     * 添加管理员
     *
     * @param manage
     * @param pw
     * @author Dave 2017/8/21
     */
    @RequestMapping(path = "add", method = RequestMethod.POST)
    public String addManager(Manage manage, PrintWriter pw) {
        String password = DigestUtils.md5Hex(manage.getPassword());//加密
        manage.setPassword(password);
        service.addManager(manage);
        return "redirect:/backstage/quanxianguanli/manageUser.jsp";
    }

    /**
     * 判断工号 是否被注册
     *
     * @param empId
     * @param pw
     * @author Dave 2017/8/21
     */
    @RequestMapping(path = "exist", method = RequestMethod.POST)
    public void checkExist(int empId, PrintWriter pw) {
        boolean isExist = service.findManagerExist(empId);
        if (isExist) {//存在 不可注册
            pw.write("no");
        } else {//可以注册
            pw.write("ok");
        }
    }

    /**
     * 分页获取管理员
     *
     * @param currentPage
     * @param userName
     * @return
     * @author Dave 2017/8/22
     */
    @RequestMapping(path = "getList", method = RequestMethod.POST)
    @ResponseBody
    public Page<Manage> getManagers(Integer currentPage, String userName) {
        Page<Manage> page = new Page<>();
        int count = service.getManageCountByName(userName);
        page.setTotalRecord(count);
        page.setCurrentPage(currentPage);
        List<Manage> manages = service.findManagesByUserName(userName, page);
        page.setList(manages);
        return page;
    }

    /**
     * 根据工号查找对象
     *
     * @param empId
     * @param map
     * @return
     * @author Dave 2017/8/22
     */
    @RequestMapping(path = "getManager", method = RequestMethod.POST)
    public String findManagerByEmpId(Integer empId, String method, Map<String, Manage> map) {
        Manage manage = service.findManageByEmpId(empId);
        map.put("manager", manage);
        String forward = "404";
        if ("check".equals(method)) {//查看
            forward = "backstage/quanxianguanli/checkMannager";
        } else if ("edit".equals(method)) {//编辑
            forward = "backstage/quanxianguanli/editManager";
        } else {
            //404
        }
        return forward;
    }

    /**
     * 修改权限
     *
     * @param empId
     * @param role
     * @param pw
     * @author Dave 2017/8/22
     */
    @RequestMapping(path = "modify", method = RequestMethod.POST)
    public void modifyManagerRole(Integer empId, String role, PrintWriter pw) {
        System.out.println("emp:" + empId + "role:" + role);
        Manage manage = service.findManageByEmpId(empId);
        if (manage == null) {
            pw.write("can not find manager!");
        } else {
            manage.setRole(role);
            boolean isSuccess = service.updateManger(manage);
            if (isSuccess) {
                pw.write("ok");
            } else
                pw.write("no");
        }
    }

    /**
     * 删除管理员
     *
     * @param empId
     * @param pw
     * @author Dave 2017/8/22
     */
    @RequestMapping(path = "remove", method = RequestMethod.POST)
    public void removeManager(Integer empId, PrintWriter pw) {
        Manage manage = service.findManageByEmpId(empId);
        if (manage != null) {
            boolean isSuccess = service.deleteManager(manage.getManagerId());
            if (isSuccess) {
                pw.write("ok");
            } else
                pw.write("fail delete!");
        } else {
            pw.write("not find this body!");
        }

    }


}
