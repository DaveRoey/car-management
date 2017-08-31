package com.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.sound.midi.SysexMessage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Enterprise;
import com.pojo.EtpRent;
import com.pojo.Page;
import com.pojo.RenterTreaty;
import com.pojo.SystemPort;
import com.service.EnterpriseService;
import com.service.EtpRentService;
import com.service.RenterTreatyService;
import com.service.SystemPortService;
/**
 * 企业用户中心（杨光）
 * @author Administrator
 *
 */
@Controller
public class EnterpriseController {

	@Resource
	private EnterpriseService enterpriseService;
	
	@Resource
	private RenterTreatyService renterTreatyService;

	@Resource
	private EtpRentService etpRentService;
	@Resource
	private SystemPortService systemPortService;
	/**
	 * 显示"企业用户信息"界面（杨光）
	 * @param session
	 * @return
	 */
	@RequestMapping(path="/qiyeyonghu/showInfor",method=RequestMethod.POST)
	public @ResponseBody Enterprise showInfor(HttpSession session){
		//通过session得到该用户的id (暂且为49)
	Enterprise temp=(Enterprise) session.getAttribute("user") ;
	int userId=temp.getEtpId();
	
	if(userId!=0){
Enterprise enterprise=enterpriseService.findEnterpriseByEtpId(userId);
		
		return enterprise;
	}else{
		return null;
	}
		
		
	}
	/**
	 * 修改密码（杨光）
	 * @param session
	 * @return
	 */
	@RequestMapping(path="qiyeyonghu/changePwd",method=RequestMethod.POST)
	public @ResponseBody String  changePwd(String newpwd,String oldpwd,HttpSession session){
		//通过session得到该用户的id (暂且为49)
		Enterprise temp=(Enterprise) session.getAttribute("user") ;
		int userId=temp.getEtpId();
		if(userId!=0){
			boolean bool= enterpriseService.changePwd(userId, newpwd, oldpwd);
			
			if(bool){
				return "ok";	
			}else{
				return "no";
			}	
			
		}else{
			return "no";
		}
		
	}
	/**
	 * 修改企业信息
	 * @param etpName
	 * @param contact
	 * @param phone
	 * @param location
	 * @param session
	 * @return
	 */
	@RequestMapping(path="qiyeyonghu/changeInfor",method=RequestMethod.POST)
	public @ResponseBody String  changeInfor(String etpName,String contact,String phone,String location,HttpSession session){
		//通过session得到该用户的id (暂且为49)
		Enterprise enterprise=new Enterprise();
		System.out.println(etpName+""+contact+" "+phone+"  "+location);
		Enterprise temp=(Enterprise) session.getAttribute("user") ;
		int userId=temp.getEtpId();
		enterprise.setEtpId(userId);
		enterprise.setContact(contact);
		enterprise.setLocation(location);
		enterprise.setPhone(phone);
		enterprise.setEtpName(etpName);
		
		if(userId!=0){
			enterpriseService.modifyEnterprise(enterprise);return "ok";	
		}else{
			return "no";	
		}
		
			
	}
	/**
	 * “显示合同”请求处理
	 * @param currentPage
	 * @return
	 */
	@RequestMapping(path="/qiyeyonghu/showAllHeTong",method=RequestMethod.POST)
	public @ResponseBody Page<RenterTreaty> showAllHeTong(Integer currentPage,HttpSession session){
		//通过session得到该用户的id (暂且为49)
		Enterprise temp=(Enterprise) session.getAttribute("user") ;
		int userId=temp.getEtpId();
		
		Page<RenterTreaty> page=new Page<>();
		//先设置总记录数
		if(userId!=0){
			Enterprise enterprise=new Enterprise();
			
			enterprise.setEtpId(userId);
			int totalreccord= renterTreatyService.findRenterTreatiesByEnterprise(enterprise).size();
			page.setTotalRecord(totalreccord);
			
			//在设置当前页
			page.setCurrentPage(currentPage);
			
			System.out.println(page.getCurrentPage()+"   总页数"+page.getTotalPage());
			
			//将page传入业务层进行处理
			List<RenterTreaty> list= renterTreatyService.getRenterTreaties(page, userId);
			page.setList(list);
			
		}
		
		return page;
		
	}	
	/**
	 * "相应合同的车位显示"处理
	 * @param treatyId
	 * @param currentPage
	 * @return
	 */
	@RequestMapping(path="/qiyeyonghu/showAllCarport",method=RequestMethod.POST)
	public @ResponseBody Page<EtpRent> showAllCarport(Integer treatyId,Integer currentPage){
		
		
		Page<EtpRent> page=new Page<>();
		//先设置总记录数
		page.setTotalRecord(etpRentService.getTotalCount(treatyId));  ;
		
		//在设置当前页
		page.setCurrentPage(currentPage);
		
		System.out.println(page.getCurrentPage()+"   总页数"+page.getTotalPage());
		
		//将page传入业务层进行处理
		List<EtpRent> list= etpRentService.findEtpRentByTreatyId(treatyId, page);
		page.setList(list);
		
		return page;
		
	}	
	
	/**
	 * “显示空余车位”请求处理
	 * @param currentPage
	 * @return
	 */
	@RequestMapping(path="/qiyeyonghu/showFreeCarPort",method=RequestMethod.POST)
	public @ResponseBody Page<SystemPort> showFreeCarPort(Integer currentPage){

		Page<SystemPort> page=new Page<>();
		//先设置总记录数
		
		 page.setTotalRecord(systemPortService.getCountByState(0)); ;
		//在设置当前页
		page.setCurrentPage(currentPage);
		
		System.out.println(page.getCurrentPage()+"   总页数"+page.getTotalPage());
		
		//将page传入业务层进行处理
		List<SystemPort> list=systemPortService.getSystemPortsBystate(0, page);
		page.setList(list);
		return page;
		
	}
	
	@RequestMapping(path="/qiyeyonghu/stop")
	public String stopLogin(HttpSession session){
		session.removeAttribute("user");
		
		return "redirect:../login.jsp";
		
	}
	
}
