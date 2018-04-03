package com.cn.test;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.cn.service.UsercourseService;

public class TestStore {
	
	@Autowired
	UsercourseService usercourseService;
	@Test
	public void Test1(){
		
		/**
		 * 测试调用数据函数
		 */
		 Map m1 = new HashMap(); 
	      m1.put("Zara", "8");
	      m1.put("Mahnaz", "31");
	      m1.put("Ayan", "12");
	      m1.put("Daisy", "14");
	      System.out.print( m1);
	    //  List<Map> scores=usercourseService.GetScoresByBid(3);
		  //System.out.println(scores);
	}
	

}
