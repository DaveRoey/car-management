package com.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.pojo.*;
import com.service.*;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
    @Resource(name = "letterServiceImpl")
    private LetterService letterService;
    @Resource(name = "renterServiceImpl")
    private RenterService renterService;
    @Resource(name = "rentPortServiceImpl")
    private RentPortService rentPortservice;
    @Resource
    private EnterpriseService enterpriseService;
    @Resource
    private LetterComplainService service;

    @RequestMapping(path = "register")
    public String register(Renter renter, Letter letter, String mtype, HttpSession session) {
        System.out.println(letter.getRealName());
        if (mtype.equals("letter")) {
            String s = DigestUtils.md5Hex(letter.getPassword());
            System.out.println(s);
            letter.setPassword(s);
            System.out.println(mtype);
            letterService.addLetter(letter);

        } else {
            String s = DigestUtils.md5Hex(renter.getPassword());
            System.out.println(s);
            renter.setPassword(s);
            renterService.addRenter(renter);
        }
        return "redirect:login.jsp";
    }

    /**
     * 登陆的验证
     *
     * @param username
     * @param userpwd
     * @param mType
     * @param write
     * @param session
     */
    @RequestMapping(path = "login")
    public void Login(String username, String userpwd, String mType, PrintWriter write, HttpSession session) {
        if (mType.equals("Letter")) {
            String s = DigestUtils.md5Hex(userpwd);
            Letter letter = letterService.findLetterByUserNameAndPassword(username, s);

            if (letter == null) {
                System.out.println("没得人");

            } else {
                session.setAttribute("user", letter);
                session.setAttribute("userType", 1);
                System.out.println(letter.getRealName());
                write.write("letter");
            }

        } else if (mType.equals("enterprise")) {
            //企业用户验证(杨光)
            String s = DigestUtils.md5Hex(userpwd);
            Enterprise enterprise = enterpriseService.login(username, s);
            System.out.println(s);
            if (enterprise == null) {
                System.out.println("无此企业用户");
            } else {

                session.setAttribute("user", enterprise);
                write.write("enterprise");
            }

        } else {
            String s = DigestUtils.md5Hex(userpwd);
            System.out.println(username);
            Renter renter = renterService.findRenterByUserNameAndPassword(username, s);
            if (renter == null) {
                System.out.println("没这个人");

            } else {
                session.setAttribute("user", renter);
                session.setAttribute("userType", "renter");
                write.write("renter");
            }

        }

    }

    @RequestMapping(path = "findMyCarports")
    public void findCarportsByLetterId(int userId) {

    }

    /**
     * @return session里面的對象
     */
    @RequestMapping(path = "getMyDetails.do")
    public @ResponseBody
    Letter getDetil(HttpSession session, HttpServletRequest request) {
        //letter login的user
        Letter letter = (Letter) session.getAttribute("user");

        //letter2 修改后的user
        Letter letter2 = (Letter) request.getAttribute("user3");

        if (letter2 != null) {//修改过
            letter2.setPassword("0");
            return letter2;
        } else {//为修改过

            return letter;
        }
    }

    /*
     *验证Letter用户名是否存在（黄赛）
     */
    @RequestMapping(path = "regexLetterUserName.do")
    public @ResponseBody
    String regexLetterUserName(String userName) {
        if (letterService.regexLetterUserName(userName) == null) {
            return "yes";
        } else {
            return "no";
        }
    }

    @RequestMapping(path = "removeSession")
    public void removeSession(HttpSession session) {
        session.removeAttribute("user");

    }

    @RequestMapping(path = "updateRenter.do")
    public String updateLetter(Renter letter, String newPwd, HttpSession session, HttpServletRequest request) {

        //letter2 login 的user
        Renter letter2 = (Renter) session.getAttribute("user");
        String s = DigestUtils.md5Hex(letter.getPassword());
        //letter3 修改过的letter
        Renter letter3 = letter2;
        if (s.equals(letter2.getPassword())) {
            //修改成功
            String newW = DigestUtils.md5Hex(newPwd);
            letter2.setPassword(newW);

            letter2.setProfession(letter.getProfession());
            letter2.setAddress(letter.getAddress());

            renterService.updateLetter(letter2);
            session.setAttribute("user", letter3);
            return "forward:login.jsp";
        } else {
            //修改失败
            letter3.setPassword(letter2.getPassword());
            letter3.setAddress(letter2.getAddress());
            letter3.setPhone(letter2.getPhone());

            request.setAttribute("user3", letter3);

            return "forward:login.jsp";
        }
    }

    /*
     *验证Renter用户名是否存在（黄赛）
     */
    @RequestMapping(path = "regexRenterUserName.do")
    public @ResponseBody
    String regexRenterUserName(String userName) {
        if (renterService.regexRenterUserName(userName) == null) {
            return "yes";
        } else {
            return "no";
        }
    }

    @RequestMapping(path = "gg.do")
    public @ResponseBody
    String ggsession(HttpSession session) {
        if (session.getAttribute("user") != null) {
            return "yes";
        } else {
            return "no";
        }
    }

    @RequestMapping(path = "tousu", method = RequestMethod.POST)
    public String addComplain(LetterComplain complain) {
        SimpleDateFormat sif=new SimpleDateFormat("yyyy-MM-dd");
        complain.setComDate(sif.format(new Date()));
        service.addLetterComplain(complain);
        return "redirect:login.jsp";
    }

    @RequestMapping(path = "checkExist", method = RequestMethod.POST)
    public void checkExist(HttpSession session, PrintWriter write) {
        if (session.getAttribute("user") != null) {

            if (session.getAttribute("user").getClass().equals(Letter.class)) {

                write.write("existLetter");

            } else {
                write.write("existRenter");

            }


        }

    }

}
