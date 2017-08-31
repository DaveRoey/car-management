package com.service.impl;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.pojo.Page;
import com.service.RenterService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
@Transactional
public class RenterServiceImplTest {

	@Resource
	private RenterService renterService;
	@Test
	public void testFindTransHistory() {
		Page<Integer> page=new Page<>()
			;
	page.setCurrentPage(1);
	page.setPageSize(5);
		System.out.println(renterService.findTransHistory(1,page).size());;
	}

}
