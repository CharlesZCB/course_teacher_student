package com.cn.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.bean.Inform;
import com.cn.mapping.InformMapping;
import com.cn.service.InformService;
/**
 * 
 * @作者  张昌北
 * @创建时间 2018年3月2日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
@Service
public class InformServiceImp implements InformService{

	@Autowired
	InformMapping inforMapping;
	@Override
	public void add(String title, String content,String writer) {
		inforMapping.insert(title,content,writer);
	}
	@Override
	public List<Inform> getAll() {
		// TODO Auto-generated method stub
		return inforMapping.getAll();
	}
	@Override
	public void deletes(int id) {
		inforMapping.deletes(id);
		
	}
	@Override
	public Inform getInforById(int id) {
		return inforMapping.getInforById(id);
	}

}
