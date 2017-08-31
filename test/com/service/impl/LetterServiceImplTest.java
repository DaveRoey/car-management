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

import com.pojo.Page;
import com.service.LetterService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
@Transactional
public class LetterServiceImplTest {
	@Resource(name="letterServiceImpl")
	private LetterService letterService;
	@Test
	public void testFindTransHistory() {
		Page<Integer> page=new Page<>();
		List<Integer> list=new ArrayList<>();
		list.add(1);
		page.setList(list);
		page.setCurrentPage(1);
		page.setPageSize(5);
				
	System.out.println(letterService.findTransHistory(1,page).size()
			);	;
		
	}

}
