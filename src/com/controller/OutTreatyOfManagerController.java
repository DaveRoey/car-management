package com.controller;

import com.pojo.OutTreaty;
import com.pojo.Page;
import com.pojo.Renewtreaty;
import com.service.OutTreatyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 后台外部合约管理
 *
 * @author Dave
 */
@Controller
@RequestMapping(path = "waibuheyue")
public class OutTreatyOfManagerController {
    @Resource
    private OutTreatyService service;

    /**
     * 添加外部合约
     *
     * @param treaty
     * @return
     * @author Dave 2017/8/23
     */
    @RequestMapping(path = "/add", method = RequestMethod.POST)
    public String addOutTreaty(OutTreaty treaty) {
        service.addOutTreaty(treaty);
        return "redirect:/backstage/waibuheyue/manageOutTreaty.jsp";
    }

    /**
     * 图片上传
     *
     * @param request
     * @param fileName
     * @param out
     * @author Dave 2017/8/23
     */
    @RequestMapping(path = "/upload", method = RequestMethod.POST)
    public void uploadFile(HttpServletRequest request, String fileName, PrintWriter out) throws Exception {
        //把Request强转成多部件请求对象
        MultipartHttpServletRequest mh = (MultipartHttpServletRequest) request;
        //根据文件名称获取文件对象
        CommonsMultipartFile cm = (CommonsMultipartFile) mh.getFile(fileName);

        //文件名称在服务器有可能重复？
        StringBuilder newFileName = new StringBuilder();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        newFileName = new StringBuilder(sdf.format(new Date()));

        Random r = new Random();
        for (int i = 0; i < 3; i++) {
            newFileName.append(r.nextInt(10));
        }
        //获取文件扩展名
        String originalFilename = cm.getOriginalFilename();
        String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
        String[] allowExtends = new String[]{".png", ".jpg"};
        System.out.println(suffix);
        if (!Arrays.asList(allowExtends).contains(suffix.toLowerCase())) {
            out.write("no:not allow");
            return;
        }
        newFileName.append(suffix);
        //创建目录
        String path = request.getServletContext().getRealPath("upload/treaty");
        File file = new File(path);
        if (!file.exists()) {
            file.mkdirs();
        }
        //新的文件路径
        String fullPath = "upload/treaty/" + newFileName;
        //文件上传
        cm.getFileItem().write(new File(file, newFileName.toString()));
        out.print("ok:" + fullPath);
    }

    /**
     * 检测合同是否被注册
     *
     * @param treatyNumber
     * @param pw
     */
    @RequestMapping(path = "exist", method = RequestMethod.POST)
    public void treatyExist(String treatyNumber, PrintWriter pw) {
        OutTreaty treaty = service.findTreatyByTreatyNumber(treatyNumber);
        pw.write(treaty == null ? "ok" : "no");
    }

    /**
     * 分页获取数据
     *
     * @param currentPage
     * @param treatyState
     * @param companyName
     * @return
     */
    @RequestMapping(path = "getList", method = RequestMethod.POST)
    @ResponseBody
    public Page<OutTreaty> findTreatyByPage(Integer currentPage, Integer treatyState, String companyName) {
        Page<OutTreaty> page = new Page<>();
        int total = service.getTotalByCondition(treatyState, companyName);
        page.setTotalRecord(total);
        page.setCurrentPage(currentPage);
        List<OutTreaty> treaties = service.findTreatyByPage(treatyState, companyName, page);
        page.setList(treaties);
        return page;
    }

    /**
     * 查看合同详细信息
     *
     * @param treatyId
     * @param map
     * @return
     */
    @RequestMapping(path = "getTreaty", method = RequestMethod.POST)
    public String findTreatyByTreatyId(Integer treatyId, String method, Map<String, OutTreaty> map) {
        OutTreaty treaty = service.findTreatyByTreatyId(treatyId);
        map.put("treaty", treaty);
        String url = "";
        if ("check".equals(method)) {
            url = "backstage/waibuheyue/checkOutTreaty";
        } else
            url = "backstage/waibuheyue/addNewTreaty";
        return url;
    }


    /**
     * 外部合同解约
     *
     * @param treatyId
     * @param pw
     */
    @RequestMapping(path = "canclelTreaty", method = RequestMethod.POST)
    public void modifyTreatyState(Integer treatyId, PrintWriter pw) {
        boolean isSuccess = service.modifyTreatyState(treatyId);
        pw.write(isSuccess ? "ok" : "no");
    }

    /**
     * 外部合同续约
     *
     * @param renewtreaty
     * @param pw
     */
    @RequestMapping(path = "/addNew", method = RequestMethod.POST)
    public void addNewTreaty(Renewtreaty renewtreaty, PrintWriter pw) {
        service.addNewTreaty(renewtreaty);
        pw.write("ok");

    }

    /**
     * 查看续约的合同
     *
     * @param treatyId
     * @param map
     * @return
     */
    @RequestMapping(path = "/checkNew", method = RequestMethod.POST)
    public String checkNewTreaty(int treatyId, Map<String, Renewtreaty> map) {
        Renewtreaty renewtreaty = service.findNewTreaty(treatyId);
        map.put("treaty", renewtreaty);
        return "backstage/waibuheyue/checkNewTreaty";
    }
}
