package com.controller;

import java.io.File;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dao.CarPortDao;
import com.pojo.CarPort;
import com.pojo.Enterprise;
import com.pojo.Letter;
import com.pojo.Page;
import com.pojo.RentPort;
import com.pojo.Renter;
import com.service.CarPortService;

@Controller
public class CarPortController {
	@Resource
	private CarPortService carPortService;
	@RequestMapping(path="/parkingLostInfo.do",method=RequestMethod.POST)
	public @ResponseBody Page<CarPort> findInfo(int currentPage,String location,int portState,HttpServletRequest request){
		Page<CarPort> page = new Page<CarPort>();
		if(location==null){
			location="";
		}
		page.setTotalRecord(carPortService.getTotalCountByLocaion(location,portState));
		page.setCurrentPage(currentPage);
		List<CarPort> list=carPortService.findCarPort(page, location,portState);
		
		
		for (CarPort carPort : list) {
			if(carPort.getPropImage()!=null){
				
				String path = request.getRealPath(carPort.getPropImage());
				System.out.println("***************************"+path);
				
			File file = new File(path);
			
			if(!file.exists()){
				carPort.setPropImage("upload/Property/s3.jpg");
			}else {
				carPort.setPropImage(carPort.getPropImage());
			}
		}
		}
		page.setList(list);
		return page;
	}
	@RequestMapping(path="/carportFindAll.do",method=RequestMethod.POST)
	public @ResponseBody CarPort findAll(int portId){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String time=sdf.format(new Date());
		CarPort c=carPortService.findCarPortByPortId(portId);
		c.setStartTime(time);
		return c;
	}
	//预约
	@RequestMapping(path="/addcarportinfo.do",method=RequestMethod.POST)
	public @ResponseBody String addcarPortinfo(Renter renter,CarPort carPort,String message,int rentState,HttpSession session,RentPort rentport,int portId){
		
		if((session.getAttribute("user")) instanceof Renter){
			rentport.setRentState(rentState);
			rentport.setMessage(message);
			
			carPort.setPortId(portId);
			rentport.setCarPort(carPort);
			
			renter.setRenterId(((Renter)(session.getAttribute("user"))).getRenterId());
			rentport.setRenter(renter);
		
			carPortService.addRenterPort(rentport);
			
			return "parkingLotsInfo.jsp";
		}
		if((session.getAttribute("user")) instanceof Letter){
			return "letter";
		}if((session.getAttribute("user")) instanceof Enterprise){
			return "enterprise";
		}
		else{
			return "login.jsp";
		}
	}
	@RequestMapping(path="/panduan.do",method=RequestMethod.GET)
	public String panduan(HttpSession session){
		if((session.getAttribute("user")) instanceof Letter){
			return "redirect:/forestage/baozupo/letterMain.html";
		}if((session.getAttribute("user")) instanceof Renter){
			return "redirect:/forestage/qiangzuke/renterMain.html";
		}if((session.getAttribute("user")) instanceof Enterprise){
			return "redirect:/forestage/qiyeyonghu/main.jsp";//没有企业页面
		}
		else{
			return "redirect:/login.jsp";
		}
	}
}
