package com.util;

import java.io.File;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.service.LetterService;
import com.service.RenterService;

public class test {
	
	

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		
		
		ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
		
	//	RenterService renterService=(RenterService) context.getBean("renterServiceImpl");
//		
		//renterService.findRenterByUserNameAndPassword("tuozhu", "222222");
		
		LetterService letterService=(LetterService) context.getBean("letterServiceImpl");
		letterService.findLetterByUserNameAndPassword("tuozhu", "222222");
		
	}
}
