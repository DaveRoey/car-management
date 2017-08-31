package com.service.impl;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.pojo.Enterprise;
import com.service.RenterTreatyService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
@Transactional
public class RenterTreatyServiceTest {
	@Resource
	private RenterTreatyService renterTreatyService;
	//
	@Test
	public void testFindRenterTreatiesByEnterprise() {
		
	}

}
