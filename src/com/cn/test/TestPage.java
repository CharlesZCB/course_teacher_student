package com.cn.test;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.cn.bean.User;
import com.cn.mapping.UserMapping;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;



@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class TestPage {
	@Autowired 
	UserMapping userMapping;
	@Test
	public void testpage(){
		PageHelper.startPage(3, 6);
		List<User> list=userMapping.list();
		for(int i=0;i<list.size();i++){
			System.out.println((i+1)+":"+list.get(i).getEmail());
			System.out.println((i+1)+":"+list.get(i).getPassword());
			System.out.println((i+1)+":"+list.get(i).getName());
			System.out.println((i+1)+":"+list.get(i).getId());
		}
		
		//获取分页信息
		PageInfo<User> pageInfo=new PageInfo<User>(list);
		//pageInfo.getTotal();
		long total=pageInfo.getTotal();
		int pages=pageInfo.getPages();
		int a=pageInfo.getNavigateFirstPage();
		System.out.println(pageInfo.getPageSize());
		System.out.println(a);
		System.out.println("共有："+pages+"页");
		System.out.println("共有："+total+"条信息");
		
	}
	
	

}
