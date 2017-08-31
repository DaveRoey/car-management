package com.service.impl;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.pojo.Page;
import com.service.EtpRentService;
import com.service.RenterTreatyService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
@Transactional
public class EtpRentServiceImplTest {

	@Resource
	private EtpRentService etpRentService;
	@Resource
	private RenterTreatyService renterTreatyService;
	
	@Test
	public void testAddEtpRent() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindEtpRentByTreatyIdIntegerPage() {
		Page page=new Page();
		page.setCurrentPage(1);
		page.setPageSize(4);
		System.out.println(renterTreatyService.getRenterTreaties(page, 49).size()
				);;
	}

	@Test
	public void testGetTotalCount() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindEtpRentByTreatyIdInteger() {
		fail("Not yet implemented");
	}

	@Test
	public void testRemoveEtpRent() {
		fail("Not yet implemented");
	}

}
