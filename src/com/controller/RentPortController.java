 	package com.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.service.RenterService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Letter;
import com.pojo.Page;
import com.pojo.RentPort;
import com.pojo.Renter;
import com.service.RentPortService;

@Controller
public class RentPortController {

	@Resource
	private RentPortService rentPortService;
	
	@RequestMapping(path="showApply.do")
	public @ResponseBody Page<RentPort> showApply(int currentPage,HttpSession session){
		Letter letter =(Letter) session.getAttribute("user");
		Page<RentPort> page = rentPortService.getApplyPage(currentPage,letter.getLetterId());
		return page;
		
	}
	@RequestMapping(path="showRenterApply",method=RequestMethod.POST)
  public @ResponseBody Page<RentPort> showRenterApply(int currentPage, int renterId){
	  Page page = rentPortService.getRenterApplyPage(currentPage,renterId);
	return page;
	  	  
  }
	
	@RequestMapping(path="letterOption.do")
	public void letterOption(int rentId,String answer,int rentState){
			rentPortService.letterOption(rentId, answer, rentState);
	
	}	 
	//求租客主动结束订单
	@RequestMapping(path="EndTheTrasaction",method=RequestMethod.POST)
	public void endTheTrasaction(int rentId,PrintWriter out){
		rentPortService.EndTheTrasaction(rentId);	
		out.write("完成交易");
	}
	@RequestMapping(path="reSendTheRequest",method=RequestMethod.POST)
   public void resendRequest(int rentId,String rentMessage,PrintWriter out){
	 
	   rentPortService.reSendRequest(rentId, rentMessage);
	   out.write("再次提交成功请查看");
	}
	@RequestMapping(path="getSessionDetails",method=RequestMethod.POST)
	public @ResponseBody Renter getSessionDetail(HttpSession session){
		Renter renter =(Renter)session.getAttribute("user");
		return renter;
	}
	@RequestMapping(path="checkRecords",method=RequestMethod.POST)
	public @ResponseBody Page<RentPort> findRecord( int renterId){
	Page list=	rentPortService.getRenterRecordPage(1, renterId);
		return list;
	}
//投诉
}
