package com.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dao.RenterDao;
import com.pojo.CarPort;
import com.pojo.Letter;
import com.pojo.Page;
import com.pojo.RentPort;
import com.pojo.Renter;
import com.service.CarPortService;
import com.service.LetterService;

@Controller
public class LetterController {

    @Resource
    private CarPortService carportservice;
    @Resource
    private LetterService letterService;
    @Resource
    private RenterDao renterDao;

    @RequestMapping(path = "showLetterCarPort.do")
    public @ResponseBody
    Page<CarPort> showLetterCarPort(int currentPage, HttpSession session) {
        Letter letter = (Letter) session.getAttribute("user");
        System.out.println(currentPage);
        Page<CarPort> page = carportservice.getLetterCarPort(currentPage, letter.getLetterId());

        return page;
    }

    @RequestMapping("")
    public @ResponseBody
    Page<RentPort> showLetterHistory() {

        Page<RentPort> page = new Page<>();
        //需要先查询总记录数
        List<RentPort> list = letterService.findTransHistory(1, page);
        return null;
    }

    @RequestMapping(path = "updateLetter.do", method = RequestMethod.POST)
    public String updateLetter(Letter letter, String newPwd, HttpSession session, HttpServletRequest request) {

        //letter2 login 的user
        Letter letter2 = (Letter) session.getAttribute("user");

        //letter3 修改过的letter
        Letter letter3 = letter2;

        if (DigestUtils.md5Hex(letter.getPassword()).equals(letter2.getPassword())) {
            //修改成功
            letter2.setPassword(DigestUtils.md5Hex(newPwd));//md5加密

            letter2.setProfession(letter.getProfession());
            letter2.setAddress(letter.getAddress());

            letterService.updateLetter(letter2);
            session.setAttribute("user", letter3);
            return "forward:letterUpSuccess.jsp";
        } else {
            //修改失败
            letter3.setPassword(letter2.getPassword());
            letter3.setAddress(letter2.getAddress());
            letter3.setPhone(letter2.getPhone());

            request.setAttribute("user3", letter3);

            return "forward:letterUpError.jsp";
        }
    }

    @RequestMapping(path = "showRecord.do")
    public @ResponseBody
    Page<RentPort> showRecord(int currentPage, HttpSession session) {
        System.out.println("123456789");
        Letter letter = (Letter) session.getAttribute("user");
        System.out.println("ddf" + letter.getLetterId());
        Page page = letterService.rentPortRecord(currentPage, letter);

        return page;
    }

    @RequestMapping(path = "recordOption.do")
    public String recordOption(HttpSession session, HttpServletRequest request) {
        String option = request.getParameter("option");
        Renter renter = renterDao.findOne(Integer.parseInt(option));
        session.setAttribute("renter", renter);
        return "tousu";
    }

    @RequestMapping(path = "exitLetter.do")
    public String exitLetter(HttpSession session) {

        session.removeAttribute("user");

        return "login";
    }
}
