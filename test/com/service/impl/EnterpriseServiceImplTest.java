package com.service.impl;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.pojo.Enterprise;
import com.service.EnterpriseService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
@Transactional
public class EnterpriseServiceImplTest {

	@Resource
	private EnterpriseService enterpriseService;
	@Test
	public void testAddEnterprise() {
		fail("Not yet implemented");
	}

	@Test
	public void testRemoveEnterprise() {
		fail("Not yet implemented");
	}

	@Test
	public void testModifyEnterprise() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindEnterpriseByEtpId() {
		System.out.println(enterpriseService.findEnterpriseByEtpId(49).getEtpName());;
	}

	@Test
	public void testFindEnterpriseByUserName() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindEnterprisesByLocationLikeAndEtpNameLikeAndContactLikeAndPhoneLike() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetTotalCountByLocationLikeAndEtpNameLikeAndContactLikeAndPhoneLike() {
		fail("Not yet implemented");
	}
	
	@Test
	public void testChanePwd() {
//		enterpriseService.changePwd(49, "111111");
//		System.out.println("改密成功");
	
	}

}
