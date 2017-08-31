package com.lovo.test;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import com.dao.EtpRentDao;
import com.dao.RenterTreatyDao;
import com.pojo.Enterprise;
import com.pojo.Page;
import com.service.CarPortService;
import com.service.EnterpriseService;
import com.service.LetterOfManagerService;
import com.service.LetterService;
import com.service.RenterTreatyService;
import com.service.SystemPortService;

public class test {
public static void main(String[] args) {
	ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
//	RenterTreatyService renterTreatyService=(RenterTreatyService) context.getBean("renterTreatyServiceImpl");
//	System.out.println("启动成功");
	Page page=new Page<>();
	page.setCurrentPage(1);
	page.setPageSize(4);
	Pageable pageable=new PageRequest(page.getCurrentPage()-1, 4);
//	System.out.println(renterTreatyService.getRenterTreaties(page, 49).size()); ;
EnterpriseService enterpriseService=(EnterpriseService) context.getBean("enterpriseServiceImpl");
	System.out.println("启动成功");
	System.out.println(enterpriseService.login("admin1", "111111").getContact()
			
			); ;
}
}
