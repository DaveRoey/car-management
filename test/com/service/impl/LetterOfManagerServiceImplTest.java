package com.service.impl;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.pojo.CarPort;
import com.pojo.Letter;
import com.pojo.Page;
import com.service.LetterOfManagerService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
@Transactional
public class LetterOfManagerServiceImplTest {

	@Resource
	private LetterOfManagerService letterOfManagerService;
	@Test
	public void testFindLetterByStateAndUserNameLike() {
		Page<Letter> page=new Page<>();
		page.setTotalRecord(8);
		page.setCurrentPage(2);
		page.setPageSize(5);
		
		Letter letter=new Letter();
		letter.setState(0);
	letter.setUserName("%%");
		List<Letter> list=new ArrayList<>();
		list.add(letter);
		page.setList(list);
		
		System.out.println(letterOfManagerService.findLetterByStateAndUserNameLike(page).size());
	}
	@Test
	public void testShenHe(){
		List<String> list =new ArrayList<>();
		list.add("2");
//		letterOfManagerService.shenHe(list);
		
	}
	@Test
	public void testGetCarPortOfState(){
		Page<CarPort> page=new Page<>();
		page.setCurrentPage(1);
		page.setPageSize(5);
		
		;
		System.out.println(letterOfManagerService.getCarPortOfState(page).size());
	}
	
	@Test
	public void testShenHeCarPort(){
//		letterOfManagerService.shenHeCarPort("1");
		
	}
	
	@Test
	public void testGetCountOfLetter(){
		Letter letter=new Letter();
		letter.setState(1);
		letter.setUserName("");
		
		System.out.println(letterOfManagerService.getCountOfLetter(letter));
		
	}
	
}
