package com.service.impl;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.LetterMapper;
import com.pojo.CarPort;
import com.pojo.Letter;
import com.service.CarPortService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="../../../../applicationContext.xml")
@Transactional
public class UserServiceImplTest {
	@Resource
	private LetterMapper mapper;

	@Resource(name="carPortServiceImpl")
	private CarPortService carPortService;
	
	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testFindAll() {
		fail("Not yet impSlemented");
	}

	@Test
	public void testRegist() {
		fail("Not yet implemented");
	}
	
	public void testFindAllaa(){
		CarPort carPort=new CarPort();
		carPortService.addCarPort(carPort);;
	} 
	
	@Test
	public void testAdd() {
		Letter le1= new Letter();
		le1.setUserName("yangzujian");
		le1.setPassword("123");
	    le1.setRealName("yangzujian");
	    le1.setAddress("jiali");
	    le1.setIndentNumber("5101012031");
	    le1.setPhone("1230120312");
	    le1.setProfession("123123");
	    le1.setEmail("yang@312.com");
	    le1.setCount(100);
	    le1.setState(0);
		mapper.insertLetter(le1);
		
	}

}
