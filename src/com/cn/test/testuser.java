package com.cn.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cn.bean.User;
import com.cn.mapping.UserMapping;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class testuser {
	@Autowired
	private UserMapping mapping;
	
	
	@Test
	public void test3(){
		System.out.println(mapping.getAllByclassId(1));
	}
	
	/**
	 * 獲取所有的記錄
	 */
	@Test
	public void getList(){
		List<User> list=mapping.list();
		for(User user:list){
			System.out.print(user.getEmail()+" ");
			System.out.print(user.getId()+" ");
			System.out.print(user.getName()+" ");
			System.out.print(user.getPassword()+" ");
			System.out.println(user.getBirth());
			
		}
	}

	/**
	 * 根據id刪除一條記錄
	 */
	@Test
	public void delete(){
		mapping.delete(2);
		
	}
	/**
	 * 插入一條記錄
	 * @throws ParseException
	 */
	@Test
	public void insert() throws ParseException{
		String date = "2010-1-2";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date newDate = sdf.parse(date);
		
	}
	/**
	 * 根據id獲取一條記錄
	 */
	@Test
	public void getOne(){
		User user=mapping.getItem(826);
		System.out.println(user.getName());
		System.out.println(user.getEmail());
		System.out.println(user.getId());
		System.out.println(user.getPassword());
		System.out.println(user.getBirth());
		
	}
	/**
	 * 根據id修改并更新一條記錄
	 * @throws ParseException
	 */
	@Test
	public void Update() throws ParseException{
		String date = "1992-2-2";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date newDate = sdf.parse(date);
		System.out.println(newDate);
	}
	
}
