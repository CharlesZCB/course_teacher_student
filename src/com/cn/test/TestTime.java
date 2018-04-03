package com.cn.test;

import java.util.Date;
import java.text.SimpleDateFormat;

import org.junit.Test;

public class TestTime {

	@Test
	public void Test1(){
		System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss") .format(new Date() )); 
	}
}
