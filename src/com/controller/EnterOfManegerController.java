package com.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.CarPort;
import com.pojo.Enterprise;
import com.pojo.Page;
import com.service.EnterpriseService;

/**
 * 后台企业用户管理（黄赛）
 * @author Administrator
 *
 */
@Controller
@RequestMapping(path="/qiyeguanli")
public class EnterOfManegerController {
	
	@Resource
	private EnterpriseService enterpriseService;
	
	@RequestMapping("/addEnterprise")
	public String addEnterprise(Enterprise enterprise){
		System.out.println(123);
		String s=DigestUtils.md5Hex(enterprise.getPassword());
		System.out.println(s);
		enterprise.setPassword(s);
		enterpriseService.addEnterprise(enterprise);
		return "backstage/qiyeguanli/manageEtp";
	}
	
	@RequestMapping("/findLikeEnterprise")
	public @ResponseBody Page<Enterprise> findAllLike(int currentPage,String location, String etpName,String contact,String phone){
		Page<Enterprise> page = new Page<Enterprise>();
		if(location==null&&etpName==null&&contact==null&&phone==null){
			location="";
			etpName="";
			contact="";
			phone="";
			System.out.println(location);
		}
		page.setTotalRecord(enterpriseService.getTotalCountByLocationLikeAndEtpNameLikeAndContactLikeAndPhoneLike(location, etpName, contact, phone));
		page.setCurrentPage(currentPage);		
		page.setList(enterpriseService.findEnterprisesByLocationLikeAndEtpNameLikeAndContactLikeAndPhoneLike(location, etpName, contact, phone, page));
		/*System.out.println(carPortService.findCarPort(page, location));*/
		return page;
	}
	
	@RequestMapping("/regexEtpName")
	public void regexEtpName(String etpName,PrintWriter out) {
		if(enterpriseService.findEnterpriseByUserName(etpName)!=null) {
			out.write("no");
		}else {
			out.write("yes");
		}

	}
	
	@RequestMapping("/deletEnterprise")
	public void  deletEnterprise(int etpId,PrintWriter pw) {
		System.out.println(123);
		if(enterpriseService.removeEnterprise(etpId)==true) {
			pw.write("1");
		}else {
			pw.write("2");
		}
	}
	@RequestMapping("/findEnterpriseById")
	public @ResponseBody Enterprise findEnterpriseById(int etpId) {
		return enterpriseService.findEnterpriseByEtpId(etpId);
	}
}
