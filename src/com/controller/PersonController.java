package com.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.pojo.Letter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.pojo.CarPort;
import com.service.CarPortService;

@Controller
public class PersonController {

    @Resource(name = "carPortServiceImpl")
    private CarPortService carPortService;

    /**
     * 发布车位信息（杨光）
     *
     * @param request
     * @throws Exception
     */
    @RequestMapping(path = "/upLoadFile", method = RequestMethod.POST)
    public String upLoadFile(HttpServletRequest request)
            throws Exception {

        //上传车位信息
        CarPort carPort = new CarPort();
        carPort.setPropNumber(request.getParameter("propNumber"));
        carPort.setLocation(request.getParameter("location"));

        carPort.setPortNumber(request.getParameter("portNumber"));

        carPort.setPrice(new BigDecimal(request.getParameter("price")));

        //SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-mm-dd");
        carPort.setStartTime(request.getParameter("startTime"));
        carPort.setEndTime(request.getParameter("endTime"));


        //得到图片地址
        String imageLocation = upload(request);
        if (imageLocation == null) {
            return "forward:forestage/baozupo/letterMain.html";
        }
        System.out.println(imageLocation);
        carPort.setPropImage(imageLocation);
        HttpSession session = request.getSession();
        Letter letter = null;
        if (session != null) {
            letter = (Letter) session.getAttribute("user");
            carPort.setLetter(letter);
            System.out.println(carPort);
            carPortService.addCarPort(carPort);
            return "forestage/baozupo/temp";
        }else {
            return "redirect:/login.jsp";
        }


    }

    //处理文件上传，返回图片地址
    public String upload(HttpServletRequest request) throws IllegalStateException, IOException {


        //此处对文件上传部分进行封装
        // @RequestParam("file") MultipartFile file,  
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());
        // 判断 request 是否有文件上传,即多部分请求  
        if (multipartResolver.isMultipart(request)) {
            // 转换成多部分request  
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            // 取得request中的所有文件名  
            Iterator<String> iter = multiRequest.getFileNames();

            while (iter.hasNext()) {
                // 取得上传文件  

                MultipartFile f = multiRequest.getFile(iter.next());

                if (f != null) {
                    // 取得当前上传文件的文件名称  
                    String myFileName = f.getOriginalFilename();

                    // 如果名称不为“”,说明该文件存在，否则说明该文件不存在 
                    //逻辑判断：只能接受jpg.png格式的数据
                    if (myFileName.contains("jpg") || myFileName.contains("png")) {
                        // 定义上传路径 
                        //物理路径
                        String realPath = request.getServletContext().getRealPath("/");
                        //   /Property/ 为不同种类的照片分配相应的文件目录

                        String subPath = "upload/Property/" + new Date().getTime() + myFileName;

                        String path = realPath + subPath;
                        File localFile = new File(path);
                        if (!localFile.exists()) {
                            localFile.mkdirs();
                        }
                        f.transferTo(localFile);
                        System.out.println("文件上传成功");
                        return subPath;

                    } else {

                        //文件格式不对，怎样处理？
                        System.out.println("格式不对");
                    }
                }
            }
        }
        return null;

    }


}
