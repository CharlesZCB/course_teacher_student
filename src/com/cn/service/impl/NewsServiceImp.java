package com.cn.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.bean.Inform;
import com.cn.bean.News;
import com.cn.mapping.InformMapping;
import com.cn.mapping.NewsMapping;
import com.cn.service.NewsService;
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
public class NewsServiceImp implements NewsService {

	@Autowired
	NewsMapping newsMapping;
	@Autowired
	InformMapping inforMapping;
	@Override
	public List<News> getAll() {
		
		return newsMapping.getalls();
	}
	@Override
	public void insertone(String title, String content, String editor, int state, String imageaddress,String image) {
		newsMapping.addone(title,content,editor,state,imageaddress,image);
		
	}
	public void deletes(int id) {
		newsMapping.deleted(id);
		
	}
	@Override
	public News getById(int id) {
		
		return newsMapping.selectById(id);
		
	}
	@Override
	public void ChangeStatueById(int id,int changeStatue) {
		newsMapping.chageStatueById(id,changeStatue);
		
	}
	@Override
	public int getStatueById(int ids) {
		return newsMapping.getStatueById(ids);
	}
	@Override
	public List<News> getNewsFiveByTime() {
		return newsMapping.getNewsFive();
	}
	@Override
	public void insertTime(Timestamp time1,int ids) {
		newsMapping.insertTime(time1,ids);
		
	}
	@Override
	public News getNewsById(int id) {
		return newsMapping.getNewsById(id);
	}


}
