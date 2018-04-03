package com.cn.test;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.cn.utils.CodeTeacherUtil;

public class Testcode {

	@Test
	public void Code1() {
		CodeTeacherUtil teacherUtil=new CodeTeacherUtil();
		for(int i=0;i<10;i++){
			System.out.println(teacherUtil.generate());
		}
		
		
	}
	
	@Test
	public void Arra(){
		List<Integer> list=new ArrayList<Integer>();
		list.add(0, 1);
		list.add(1,2);
		list.add(2,3);
		System.out.println(list);
		list.set(1, 9);
		System.out.println(list);
	}
}
