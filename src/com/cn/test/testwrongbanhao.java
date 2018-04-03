package com.cn.test;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cn.mapping.ClassroomMapping;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class testwrongbanhao {
	@Autowired
	private ClassroomMapping classroomMapping;
	@Test
	public void M1(){
	   String jibie="2000";
	   String banming="软件技术";
	   List<Integer> banhao=classroomMapping.getBanhaoByNameJibie(banming,jibie);
	   System.out.println(banhao);
	   
	  
       
	}

}
