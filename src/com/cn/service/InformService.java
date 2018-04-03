package com.cn.service;

import java.util.List;

import com.cn.bean.Inform;
/**
 * 
 * @作者  张昌北
 * @创建时间 2018年3月2日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
public interface InformService {

	void add(String title, String content,String writer);

	List<Inform> getAll();

	void deletes(int id);

	Inform getInforById(int id);

}
