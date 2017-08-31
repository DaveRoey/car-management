package com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.LetterComplain;
import com.pojo.RentPort;
import com.pojo.RenterComplain;
import com.service.LetterComplainService;
import com.service.RenterComplainService;

@Controller
public class RenterComplainController {
	@Resource
	private RenterComplainService renterComplainService;
	@Resource
	private LetterComplainService letterComplainService;
	//传递抢租客投诉信息
	@RequestMapping(path="addtousuInfo.do")
	public @ResponseBody String addtousuInfo(RentPort rentPort,int renterId,String message,Date myDate,int comState,HttpSession session){
		/*SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=sdf.format(myDate);*/
		String userType = (String) session.getAttribute("userType");
		if("letter".equals(userType)){
			LetterComplain letterComplain = new LetterComplain();
			letterComplain.setComDate(myDate.toString());
			rentPort.setRentId(renterId);
			letterComplain.setRentPort(rentPort);
			letterComplain.setComState(comState);
			letterComplain.setReason(message);
			letterComplainService.addLetterComplain(letterComplain);
			return "letterMainPage.html";
		}else{
			RenterComplain renterComplain = new RenterComplain();
			renterComplain.setComDate(myDate.toString());
			rentPort.setRentId(renterId);
			renterComplain.setRentPort(rentPort);
			renterComplain.setComState(comState);
			renterComplain.setReason(message);
			renterComplainService.addRenterComplain(renterComplain);
			return "renterMainPage.html";
		}
		
	}
}
